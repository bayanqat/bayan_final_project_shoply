import 'package:dartz/dartz.dart';

import '../../../../data/entities/category_entity.dart';

abstract class CategoryRepo {
  Future<Either<String, List<CategoryEntity>>> getCategories();
}
