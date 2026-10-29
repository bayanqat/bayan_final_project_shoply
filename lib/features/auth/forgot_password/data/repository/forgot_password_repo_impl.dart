import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/helper/error_handle_helper.dart';
import '../../domain/repository/forgot_password_repo.dart';
import '../datasource/forgot_password_remote_datasource.dart';

class ForgotPasswordRepoImpl implements ForgotPasswordRepo {
  final ForgotPasswordRemoteDataSource forgotPasswordRemoteDataSource;

  ForgotPasswordRepoImpl(this.forgotPasswordRemoteDataSource);

  @override
  Future<Either<String, String>> sendResetLink({required String email}) async {
    try {
      await forgotPasswordRemoteDataSource.sendResetLink(email: email);
      return Right('If an account exists for $email, a reset link has been sent to it.');
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException: ${e.code} - ${e.message}');
      return Left(ErrorHandleHelper.getCustomErrorMessage(e.code));
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.code} - ${e.message}');
      return Left(e.message ?? '');
    }
  }
}
