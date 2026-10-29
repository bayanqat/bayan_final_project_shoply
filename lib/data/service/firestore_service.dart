import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/constants/firestore_collections.dart';

class FirestoreService {
  static String currentUid() {
    return FirebaseAuth.instance.currentUser?.uid ?? '';
  }

  static DocumentReference<Map<String, dynamic>> currentUserDoc() {
    return FirebaseFirestore.instance.collection(FirestoreCollections.users).doc(currentUid());
  }
}
