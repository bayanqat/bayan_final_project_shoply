import 'package:dartz/dartz.dart';

import '../../../../../data/entities/user_entity.dart';
import '../repository/login_repo.dart';

class LoginUseCase {
  final LoginRepo loginRepo;

  LoginUseCase(this.loginRepo);

  Future<Either<String, UserEntity>> call({required String email, required String password}) {
    return loginRepo.login(email: email, password: password);
  }
}
