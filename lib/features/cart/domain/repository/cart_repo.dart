import 'package:dartz/dartz.dart';

import '../../../../data/entities/cart_item_entity.dart';

abstract class CartRepo {
  Future<Either<String, List<CartItemEntity>>> getCart();

  Future<Either<String, bool>> addToCart({required String productId, required int quantity});

  Future<Either<String, bool>> updateQuantity({required String productId, required int quantity});

  Future<Either<String, bool>> removeFromCart({required String productId});

  Future<Either<String, int>> checkout({required List<CartItemEntity> items});
}
