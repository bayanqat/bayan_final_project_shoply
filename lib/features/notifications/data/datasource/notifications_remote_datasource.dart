import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/firestore_collections.dart';
import '../../../../data/service/firestore_service.dart';
import '../models/notification_model.dart';

class NotificationsRemoteDataSource {
  CollectionReference<Map<String, dynamic>> get _notifications =>
      FirestoreService.currentUserDoc().collection(FirestoreCollections.notifications);

  Future<List<NotificationModel>> getNotifications() async {
    final snapshot = await _notifications.orderBy('createdAt', descending: true).get();
    return snapshot.docs
        .map((doc) => NotificationModel.fromJson({...doc.data(), 'id': doc.id}))
        .toList();
  }

  Future<void> markAllAsRead() async {
    final unread = await _notifications.where('isRead', isEqualTo: false).get();
    if (unread.docs.isEmpty) return;
    final batch = FirebaseFirestore.instance.batch();
    for (final doc in unread.docs) {
      batch.update(doc.reference, {'isRead': true});
    }
    await batch.commit();
  }
}
