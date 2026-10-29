import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/firestore_collections.dart';
import '../models/legal_content_model.dart';

class LegalRemoteDataSource {
  /// docId is FirestoreCollections.privacyPolicyDoc or termsConditionsDoc
  Future<LegalContentModel> getContent({required String docId}) async {
    final snapshot = await FirebaseFirestore.instance
        .collection(FirestoreCollections.appContent)
        .doc(docId)
        .get();
    return LegalContentModel.fromJson(snapshot.data() ?? {});
  }
}
