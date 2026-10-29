import 'package:dartz/dartz.dart';

import '../repository/change_password_repo.dart';

class ChangePasswordUseCase {
  final ChangePasswordRepo changePasswordRepo;

  ChangePasswordUseCase(this.changePasswordRepo);

  Future<Either<String, String>> call({
    required String currentPassword,
    required String newPassword,
  }) {
    return changePasswordRepo.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}
