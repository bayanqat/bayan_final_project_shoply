import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/constants/firestore_collections.dart';
import '../models/product/product_model.dart';

class ProductService {
  /// Used by favorites and cart, which only store product ids
  static Future<Map<String, ProductModel>> getProductsByIds(List<String> ids) async {
    final products = <String, ProductModel>{};
    // whereIn accepts at most 30 values per query
    for (var i = 0; i < ids.length; i += 30) {
      final chunk = ids.sublist(i, min(i + 30, ids.length));
      final snapshot = await FirebaseFirestore.instance
          .collection(FirestoreCollections.products)
          .where(FieldPath.documentId, whereIn: chunk)
          .get();
      for (final doc in snapshot.docs) {
        products[doc.id] = ProductModel.fromJson({...doc.data(), 'id': doc.id});
      }
    }
    return products;
  }
}
