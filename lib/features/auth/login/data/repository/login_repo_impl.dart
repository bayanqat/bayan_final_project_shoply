import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/helper/error_handle_helper.dart';
import '../../../../../data/entities/user_entity.dart';
import '../../domain/repository/login_repo.dart';
import '../datasource/login_remote_datasource.dart';

class LoginRepoImpl implements LoginRepo {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepoImpl(this.loginRemoteDataSource);

  @override
  Future<Either<String, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await loginRemoteDataSource.login(email: email, password: password);
      return Right(userModel.toEntity());
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException: ${e.code} - ${e.message}');
      return Left(ErrorHandleHelper.getCustomErrorMessage(e.code));
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.code} - ${e.message}');
      return Left(e.message ?? '');
    }
  }
}
