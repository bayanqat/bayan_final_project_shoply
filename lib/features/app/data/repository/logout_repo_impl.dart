import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repository/logout_repo.dart';
import '../datasource/logout_remote_datasource.dart';

class LogoutRepoImpl implements LogoutRepo {
  final LogoutRemoteDataSource logoutRemoteDataSource;

  LogoutRepoImpl(this.logoutRemoteDataSource);

  @override
  Future<Either<String, bool>> logout() async {
    try {
      await logoutRemoteDataSource.logout();
      return Right(true);
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.code} - ${e.message}');
      return Left(e.message ?? '');
    }
  }
}
