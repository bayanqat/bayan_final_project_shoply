import 'package:dartz/dartz.dart';

abstract class ChangePasswordRepo {
  Future<Either<String, String>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}
