import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/constants/firestore_collections.dart';
import '../../../../data/models/user/user_model.dart';
import '../../../../data/service/upload_image_service.dart';

/// UploadImageService returns null instead of throwing, so this marks a failed upload
class UploadImageException implements Exception {}

class UpdateProfileRemoteDataSource {
  Future<UserModel> getProfile() async {
    final firestore = FirebaseFirestore.instance;
    final authUser = FirebaseAuth.instance.currentUser!;
    var snapshot = await firestore.collection(FirestoreCollections.users).doc(authUser.uid).get();
    // Accounts created before the switch to `users` still have their profile in `User`
    if (!snapshot.exists) {
      snapshot = await firestore
          .collection(FirestoreCollections.legacyUsers)
          .doc(authUser.uid)
          .get();
    }
    final data = snapshot.data() ?? {};
    return UserModel.fromJson({
      ...data,
      // The seeder writes `username`, the app writes `userName`
      'userName': data['userName'] ?? data['username'],
    }).copyWith(
      uid: authUser.uid,
      // Firebase Auth always has the sign-in email
      email: (data['email'] as String?)?.isNotEmpty ?? false ? data['email'] : authUser.email,
    );
  }

  Future<UserModel> updateProfile({required UserModel userModel, required File? image}) async {
    final imageUrl = await _uploadImage(image: image);
    if (image != null && imageUrl == null) {
      throw UploadImageException();
    }
    // Keep the old picture when no new one was picked
    final updatedUser = userModel.copyWith(profileImage: imageUrl ?? userModel.profileImage);
    await FirebaseFirestore.instance
        .collection(FirestoreCollections.users)
        .doc(updatedUser.uid)
        .set(updatedUser.toJson(), SetOptions(merge: true));
    return updatedUser;
  }

  Future<String?> _uploadImage({required File? image}) async {
    if (image == null) return null;
    return UploadImageService.uplaodImage(imageFile: image);
  }
}
