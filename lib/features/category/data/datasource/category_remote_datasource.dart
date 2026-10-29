import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/firestore_collections.dart';
import '../../../../data/models/category/category_model.dart';

class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories() async {
    final snapshot = await FirebaseFirestore.instance
        .collection(FirestoreCollections.categories)
        .orderBy('name')
        .get();
    return snapshot.docs
        .map((doc) => CategoryModel.fromJson({...doc.data(), 'id': doc.id}))
        .toList();
  }
}
