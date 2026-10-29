import 'package:dartz/dartz.dart';

import '../../../../data/entities/product_entity.dart';

abstract class FavoriteRepo {
  Future<Either<String, List<ProductEntity>>> getFavorites();

  Future<Either<String, bool>> addFavorite({required String productId});

  Future<Either<String, bool>> removeFavorite({required String productId});
}
