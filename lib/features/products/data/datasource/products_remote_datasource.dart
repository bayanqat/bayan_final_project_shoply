import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/firestore_collections.dart';
import '../../../../data/models/product/product_model.dart';

class ProductsRemoteDataSource {
  Future<List<ProductModel>> getProducts({String? categoryId, int? limit}) async {
    Query<Map<String, dynamic>> query = FirebaseFirestore.instance.collection(
      FirestoreCollections.products,
    );
    if (categoryId != null) {
      query = query.where('categoryId', isEqualTo: categoryId);
    }
    if (limit != null) {
      query = query.limit(limit);
    }
    final snapshot = await query.get();
    return snapshot.docs
        .map((doc) => ProductModel.fromJson({...doc.data(), 'id': doc.id}))
        .toList();
  }
}
