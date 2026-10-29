import 'package:dartz/dartz.dart';

import '../../../../../data/entities/user_entity.dart';

abstract class LoginRepo {
  Future<Either<String, UserEntity>> login({required String email, required String password});
}
