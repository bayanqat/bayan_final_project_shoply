import 'package:dartz/dartz.dart';

import '../../../../data/entities/product_entity.dart';
import '../repository/products_repo.dart';

class ProductsUseCase {
  final ProductsRepo productsRepo;

  ProductsUseCase(this.productsRepo);

  /// categoryId == null returns products from every category
  Future<Either<String, List<ProductEntity>>> call({String? categoryId, int? limit}) {
    return productsRepo.getProducts(categoryId: categoryId, limit: limit);
  }
}
