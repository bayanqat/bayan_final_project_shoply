import 'package:dartz/dartz.dart';

import '../../../../data/entities/product_entity.dart';

abstract class ProductsRepo {
  Future<Either<String, List<ProductEntity>>> getProducts({String? categoryId, int? limit});
}
