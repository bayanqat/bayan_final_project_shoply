import 'package:dartz/dartz.dart';

import '../../../../data/entities/cart_item_entity.dart';
import '../repository/cart_repo.dart';

class CartUseCase {
  final CartRepo cartRepo;

  CartUseCase(this.cartRepo);

  Future<Either<String, List<CartItemEntity>>> getCart() {
    return cartRepo.getCart();
  }

  Future<Either<String, bool>> addToCart({required String productId, required int quantity}) {
    return cartRepo.addToCart(productId: productId, quantity: quantity);
  }

  Future<Either<String, bool>> updateQuantity({required String productId, required int quantity}) {
    return cartRepo.updateQuantity(productId: productId, quantity: quantity);
  }

  Future<Either<String, bool>> removeFromCart({required String productId}) {
    return cartRepo.removeFromCart(productId: productId);
  }

  Future<Either<String, int>> checkout({required List<CartItemEntity> items}) {
    return cartRepo.checkout(items: items);
  }
}
