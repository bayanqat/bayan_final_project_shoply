import 'package:dartz/dartz.dart';

import '../repository/logout_repo.dart';

class LogoutUsecase {
  final LogoutRepo logoutRepo;

  LogoutUsecase(this.logoutRepo);

  Future<Either<String, bool>> call() {
    return logoutRepo.logout();
  }
}
