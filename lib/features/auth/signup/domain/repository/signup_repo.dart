import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../data/entities/user_entity.dart';

abstract class SignupRepo {
  Future<Either<String, bool>> signup({
    required UserEntity user,
    required String password,
    required File? image,
  });
}
