import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../data/entities/user_entity.dart';
import '../repository/update_profile_repo.dart';

class UpdateProfileUseCase {
  final UpdateProfileRepo updateProfileRepo;

  UpdateProfileUseCase(this.updateProfileRepo);

  Future<Either<String, UserEntity>> getProfile() {
    return updateProfileRepo.getProfile();
  }

  Future<Either<String, UserEntity>> call({required UserEntity user, required File? image}) {
    return updateProfileRepo.updateProfile(user: user, image: image);
  }
}
