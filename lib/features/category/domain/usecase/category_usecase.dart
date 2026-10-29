import 'package:dartz/dartz.dart';

import '../../../../data/entities/category_entity.dart';
import '../repository/category_repo.dart';

class CategoryUseCase {
  final CategoryRepo categoryRepo;

  CategoryUseCase(this.categoryRepo);

  Future<Either<String, List<CategoryEntity>>> call() {
    return categoryRepo.getCategories();
  }
}
