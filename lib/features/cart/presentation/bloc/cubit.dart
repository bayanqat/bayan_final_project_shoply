import 'package:final_project_shoply/features/cart/presentation/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/entities/cart_item_entity.dart';
import '../../../../data/entities/product_entity.dart';
import '../../data/datasource/cart_remote_datasource.dart';
import '../../data/repository/cart_repo_impl.dart';
import '../../domain/usecase/cart_usecase.dart';

/// Shared by the cart tab and every Add to Cart button, provided on the main screen route
class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitState());

  final _cartUseCase = CartUseCase(CartRepoImpl(CartRemoteDataSource()));

  List<CartItemEntity> items = [];

  double get totalPrice => items.fold(0, (total, item) => total + item.totalPrice);

  Future<void> getCart() async {
    emit(CartLoadingState());
    final result = await _cartUseCase.getCart();
    result.fold(
      (errorMessage) {
        emit(CartErrorState(errorMessage: errorMessage));
      },
      (cartItems) {
        items = cartItems;
        emit(CartSuccessState());
      },
    );
  }

  Future<void> addToCart({required ProductEntity product, required int quantity}) async {
    final result = await _cartUseCase.addToCart(productId: product.id ?? '', quantity: quantity);
    result.fold(
      (errorMessage) {
        emit(CartActionErrorState(errorMessage: errorMessage));
      },
      (_) {
        final index = items.indexWhere((item) => item.product.id == product.id);
        if (index == -1) {
          items = [...items, CartItemEntity(product: product, quantity: quantity)];
        } else {
          items = [
            for (final item in items)
              item.product.id == product.id
                  ? item.copyWith(quantity: item.quantity + quantity)
                  : item,
          ];
        }
        emit(CartAddSuccessState(message: '${product.name} added to cart'));
      },
    );
  }

  Future<void> updateQuantity({required String productId, required int quantity}) async {
    if (quantity < 1) return;
    final previousItems = items;
    // Update the screen right away, then save to Firestore
    items = [
      for (final item in items)
        item.product.id == productId ? item.copyWith(quantity: quantity) : item,
    ];
    emit(CartSuccessState());

    final result = await _cartUseCase.updateQuantity(productId: productId, quantity: quantity);
    result.fold((errorMessage) {
      items = previousItems;
      emit(CartActionErrorState(errorMessage: errorMessage));
    }, (_) {});
  }

  Future<void> removeFromCart({required String productId}) async {
    final previousItems = items;
    items = items.where((item) => item.product.id != productId).toList();
    emit(CartSuccessState());

    final result = await _cartUseCase.removeFromCart(productId: productId);
    result.fold((errorMessage) {
      items = previousItems;
      emit(CartActionErrorState(errorMessage: errorMessage));
    }, (_) {});
  }

  Future<void> checkout() async {
    if (items.isEmpty) return;
    emit(CartCheckoutLoadingState());
    final result = await _cartUseCase.checkout(items: items);
    result.fold(
      (errorMessage) {
        emit(CartCheckoutErrorState(errorMessage: errorMessage));
      },
      (orderNumber) {
        items = [];
        emit(
          CartCheckoutSuccessState(
            successMessage:
                'Your order #$orderNumber has been placed. You can follow it in My Orders.',
          ),
        );
      },
    );
  }
}
