import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../data/entities/user_entity.dart';
import '../repository/signup_repo.dart';

class SignupUseCase {
  final SignupRepo signupRepo;

  SignupUseCase(this.signupRepo);

  Future<Either<String, bool>> call({
    required UserEntity user,
    required String password,
    required File? image,
  }) {
    return signupRepo.signup(user: user, password: password, image: image);
  }
}
