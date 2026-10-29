import 'package:dartz/dartz.dart';

abstract class ForgotPasswordRepo {
  Future<Either<String, String>> sendResetLink({required String email});
}
