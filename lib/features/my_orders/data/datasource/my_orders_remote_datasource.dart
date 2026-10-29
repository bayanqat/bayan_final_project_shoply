import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/firestore_collections.dart';
import '../../../../data/service/firestore_service.dart';
import '../models/order_model.dart';

class MyOrdersRemoteDataSource {
  Future<List<OrderModel>> getOrders() async {
    final snapshot = await FirebaseFirestore.instance
        .collection(FirestoreCollections.orders)
        .where('userId', isEqualTo: FirestoreService.currentUid())
        .get();
    final orders = snapshot.docs
        .map((doc) => OrderModel.fromJson({...doc.data(), 'id': doc.id}))
        .toList();
    // Sorted here instead of orderBy, which would need a composite Firestore index
    orders.sort((a, b) {
      return (b.createdAt ?? DateTime.now()).compareTo(a.createdAt ?? DateTime.now());
    });
    return orders;
  }
}
