import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/firestore_collections.dart';
import '../../../../data/models/product/product_model.dart';
import '../../../../data/service/firestore_service.dart';
import '../../../../data/service/product_service.dart';

class FavoriteRemoteDataSource {
  CollectionReference<Map<String, dynamic>> get _favorites =>
      FirestoreService.currentUserDoc().collection(FirestoreCollections.favorites);

  Future<List<ProductModel>> getFavorites() async {
    final snapshot = await _favorites.orderBy('addedAt', descending: true).get();
    final ids = snapshot.docs.map((doc) => doc.id).toList();
    final products = await ProductService.getProductsByIds(ids);
    // Keep the newest-first order and skip products that were deleted
    return [
      for (final id in ids)
        if (products[id] != null) products[id]!,
    ];
  }

  Future<void> addFavorite({required String productId}) async {
    await _favorites.doc(productId).set({
      'productId': productId,
      'addedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> removeFavorite({required String productId}) async {
    await _favorites.doc(productId).delete();
  }
}
