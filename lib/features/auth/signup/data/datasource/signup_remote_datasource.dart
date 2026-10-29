import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/constants/firestore_collections.dart';
import '../../../../../data/models/user/user_model.dart';
import '../../../../../data/service/upload_image_service.dart';

class SignupRemoteDataSource {
  Future<void> signup({
    required UserModel userModel,
    required String password,
    required File? image,
  }) async {
    final snapshot = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: userModel.email ?? '',
      password: password,
    );
    final user = snapshot.user!;
    await _sendEmailVerification(user: user);
    final imageUrl = await _uploadImage(image: image);
    await _saveUserData(
      userModel: userModel.copyWith(uid: user.uid, profileImage: imageUrl),
    );
  }

  Future<String?> _uploadImage({required File? image}) async {
    if (image == null) return null;
    return UploadImageService.uplaodImage(imageFile: image);
  }

  Future<void> _sendEmailVerification({required User user}) async {
    await user.sendEmailVerification();
  }

  Future<void> _saveUserData({required UserModel userModel}) async {
    await FirebaseFirestore.instance
        .collection(FirestoreCollections.users)
        .doc(userModel.uid)
        .set(userModel.toJson());
  }
}
