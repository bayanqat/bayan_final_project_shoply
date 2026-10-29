import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../data/entities/user_entity.dart';

abstract class UpdateProfileRepo {
  Future<Either<String, UserEntity>> getProfile();

  Future<Either<String, UserEntity>> updateProfile({
    required UserEntity user,
    required File? image,
  });
}
