import 'package:dartz/dartz.dart';

import '../entities/about_entity.dart';
import '../repository/about_repo.dart';

class AboutUseCase {
  final AboutRepo aboutRepo;

  AboutUseCase(this.aboutRepo);

  Future<Either<String, AboutEntity>> call() {
    return aboutRepo.getAbout();
  }
}
