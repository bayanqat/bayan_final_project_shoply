import 'package:dartz/dartz.dart';

import '../entities/about_entity.dart';

abstract class AboutRepo {
  Future<Either<String, AboutEntity>> getAbout();
}
