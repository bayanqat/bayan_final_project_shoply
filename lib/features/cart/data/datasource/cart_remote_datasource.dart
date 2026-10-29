import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/firestore_collections.dart';
import '../../../../data/models/cart/cart_item_model.dart';
import '../../../../data/service/firestore_service.dart';
import '../../../../data/service/product_service.dart';

class CartRemoteDataSource {
  CollectionReference<Map<String, dynamic>> get _cart =>
      FirestoreService.currentUserDoc().collection(FirestoreCollections.cart);

  Future<List<CartItemModel>> getCart() async {
    final snapshot = await _cart.orderBy('addedAt').get();
    final quantities = {
      for (final doc in snapshot.docs) doc.id: (doc.data()['quantity'] as num?)?.toInt() ?? 1,
    };
    final products = await ProductService.getProductsByIds(quantities.keys.toList());
    // Skip cart entries whose product was deleted
    return [
      for (final entry in quantities.entries)
        if (products[entry.key] != null)
          CartItemModel(product: products[entry.key]!, quantity: entry.value),
    ];
  }

  Future<void> addToCart({required String productId, required int quantity}) async {
    // merge + increment adds to the quantity if the product is already in the cart
    await _cart.doc(productId).set({
      'productId': productId,
      'quantity': FieldValue.increment(quantity),
      'addedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Future<void> updateQuantity({required String productId, required int quantity}) async {
    await _cart.doc(productId).update({'quantity': quantity});
  }

  Future<void> removeFromCart({required String productId}) async {
    await _cart.doc(productId).delete();
  }

  /// Creates the order, adds a notification and empties the cart in one batch,
  /// returns the order number
  Future<int> checkout({required List<CartItemModel> items}) async {
    final firestore = FirebaseFirestore.instance;
    final batch = firestore.batch();
    final orderNumber = DateTime.now().millisecondsSinceEpoch % 1000000;
    final itemsCount = items.fold<int>(0, (total, item) => total + item.quantity);
    final totalPrice = items.fold<double>(
      0,
      (total, item) => total + (item.product.price ?? 0) * item.quantity,
    );

    batch.set(firestore.collection(FirestoreCollections.orders).doc(), {
      'orderNumber': orderNumber,
      'userId': FirestoreService.currentUid(),
      'status': 'pending',
      'items': [
        for (final item in items)
          {
            'productId': item.product.id,
            'name': item.product.name,
            'image': item.product.image ?? '',
            'price': item.product.price,
            'quantity': item.quantity,
          },
      ],
      'itemsCount': itemsCount,
      'totalPrice': totalPrice,
      'createdAt': FieldValue.serverTimestamp(),
    });
    // Shows up in the Notifications screen
    batch.set(
      FirestoreService.currentUserDoc().collection(FirestoreCollections.notifications).doc(),
      {
        'title': 'Order placed',
        'body':
            'Your order #$orderNumber with $itemsCount ${itemsCount == 1 ? 'item' : 'items'} is pending.',
        'type': 'order',
        'isRead': false,
        'createdAt': FieldValue.serverTimestamp(),
      },
    );
    for (final item in items) {
      batch.delete(_cart.doc(item.product.id));
    }
    await batch.commit();
    return orderNumber;
  }
}
