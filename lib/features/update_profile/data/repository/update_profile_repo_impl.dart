import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../data/entities/user_entity.dart';
import '../../../../data/models/user/user_model.dart';
import '../../domain/repository/update_profile_repo.dart';
import '../datasource/update_profile_remote_datasource.dart';

class UpdateProfileRepoImpl implements UpdateProfileRepo {
  final UpdateProfileRemoteDataSource updateProfileRemoteDataSource;

  UpdateProfileRepoImpl(this.updateProfileRemoteDataSource);

  @override
  Future<Either<String, UserEntity>> getProfile() async {
    try {
      final userModel = await updateProfileRemoteDataSource.getProfile();
      return Right(userModel.toEntity());
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.code} - ${e.message}');
      return Left(e.message ?? '');
    }
  }

  @override
  Future<Either<String, UserEntity>> updateProfile({
    required UserEntity user,
    required File? image,
  }) async {
    try {
      final userModel = await updateProfileRemoteDataSource.updateProfile(
        userModel: UserModel.fromEntity(user),
        image: image,
      );
      return Right(userModel.toEntity());
    } on UploadImageException {
      return Left('Could not save the profile picture. Please choose a smaller image.');
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.code} - ${e.message}');
      return Left(e.message ?? '');
    } catch (e) {
      // Any other error would leave the loading dialog open forever
      log('Update profile error: $e');
      return Left('Something went wrong. Please try again.');
    }
  }
}
