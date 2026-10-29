import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/firestore_collections.dart';
import '../../../../data/service/firestore_service.dart';
import '../models/contact_info_model.dart';

class ContactUsRemoteDataSource {
  Future<ContactInfoModel> getContactInfo() async {
    final snapshot = await FirebaseFirestore.instance
        .collection(FirestoreCollections.appContent)
        .doc(FirestoreCollections.contactDoc)
        .get();
    return ContactInfoModel.fromJson(snapshot.data() ?? {});
  }

  Future<void> sendMessage({
    required String fullName,
    required String email,
    required String subject,
    required String message,
  }) async {
    await FirebaseFirestore.instance.collection(FirestoreCollections.contactMessages).add({
      'userId': FirestoreService.currentUid(),
      'fullName': fullName,
      'email': email,
      'subject': subject,
      'message': message,
      'status': 'new',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
