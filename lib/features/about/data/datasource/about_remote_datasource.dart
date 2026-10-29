import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/firestore_collections.dart';
import '../models/about_model.dart';

class AboutRemoteDataSource {
  Future<AboutModel> getAbout() async {
    final snapshot = await FirebaseFirestore.instance
        .collection(FirestoreCollections.appContent)
        .doc(FirestoreCollections.aboutDoc)
        .get();
    return AboutModel.fromJson(snapshot.data() ?? {});
  }
}
