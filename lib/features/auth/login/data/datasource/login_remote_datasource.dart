import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/constants/firestore_collections.dart';
import '../../../../../data/models/user/user_model.dart';

class LoginRemoteDataSource {
  Future<UserModel> login({required String email, required String password}) async {
    final snapshot = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = snapshot.user!;
    if (!user.emailVerified) {
      throw FirebaseAuthException(code: 'email-not-verified');
    }
    return _getUserInfo(uid: user.uid);
  }

  Future<UserModel> _getUserInfo({required String uid}) async {
    final snapshot = await FirebaseFirestore.instance
        .collection(FirestoreCollections.users)
        .doc(uid)
        .get();
    return UserModel.fromJson(snapshot.data() ?? {});
  }
}
