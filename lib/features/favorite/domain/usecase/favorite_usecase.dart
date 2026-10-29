import 'package:dartz/dartz.dart';

import '../../../../data/entities/product_entity.dart';
import '../repository/favorite_repo.dart';

class FavoriteUseCase {
  final FavoriteRepo favoriteRepo;

  FavoriteUseCase(this.favoriteRepo);

  Future<Either<String, List<ProductEntity>>> getFavorites() {
    return favoriteRepo.getFavorites();
  }

  Future<Either<String, bool>> addFavorite({required String productId}) {
    return favoriteRepo.addFavorite(productId: productId);
  }

  Future<Either<String, bool>> removeFavorite({required String productId}) {
    return favoriteRepo.removeFavorite(productId: productId);
  }
}
