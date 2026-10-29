import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/helper/error_handle_helper.dart';
import '../../domain/repository/change_password_repo.dart';
import '../datasource/change_password_remote_datasource.dart';

class ChangePasswordRepoImpl implements ChangePasswordRepo {
  final ChangePasswordRemoteDataSource changePasswordRemoteDataSource;

  ChangePasswordRepoImpl(this.changePasswordRemoteDataSource);

  @override
  Future<Either<String, String>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      await changePasswordRemoteDataSource.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      return Right('Your password has been updated.');
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException: ${e.code} - ${e.message}');
      return Left(ErrorHandleHelper.getCustomErrorMessage(e.code));
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.code} - ${e.message}');
      return Left(e.message ?? '');
    }
  }
}
