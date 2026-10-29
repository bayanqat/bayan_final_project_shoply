import 'package:dartz/dartz.dart';

import '../repository/forgot_password_repo.dart';

class ForgotPasswordUseCase {
  final ForgotPasswordRepo forgotPasswordRepo;

  ForgotPasswordUseCase(this.forgotPasswordRepo);

  Future<Either<String, String>> call({required String email}) {
    return forgotPasswordRepo.sendResetLink(email: email);
  }
}
