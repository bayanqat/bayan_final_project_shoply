import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/helper/error_handle_helper.dart';
import '../../../../../data/entities/user_entity.dart';
import '../../../../../data/models/user/user_model.dart';
import '../../domain/repository/signup_repo.dart';
import '../datasource/signup_remote_datasource.dart';

class SignupRepoImpl implements SignupRepo {
  final SignupRemoteDataSource signupRemoteDataSource;

  SignupRepoImpl(this.signupRemoteDataSource);

  @override
  Future<Either<String, bool>> signup({
    required UserEntity user,
    required String password,
    required File? image,
  }) async {
    try {
      await signupRemoteDataSource.signup(
        userModel: UserModel.fromEntity(user),
        password: password,
        image: image,
      );
      return const Right(true);
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException: ${e.code} - ${e.message}');
      return Left(ErrorHandleHelper.getCustomErrorMessage(e.code));
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.code} - ${e.message}');
      return Left(e.message ?? '');
    }
  }
}
