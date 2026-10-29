abstract class CartState {}

class CartInitState extends CartState {}

class CartLoadingState extends CartState {}

class CartErrorState extends CartState {
  final String errorMessage;

  CartErrorState({required this.errorMessage});
}

class CartSuccessState extends CartState {}

class CartAddSuccessState extends CartState {
  final String message;

  CartAddSuccessState({required this.message});
}

/// Add, update or remove failed; the cart was restored
class CartActionErrorState extends CartState {
  final String errorMessage;

  CartActionErrorState({required this.errorMessage});
}

class CartCheckoutLoadingState extends CartState {}

class CartCheckoutErrorState extends CartState {
  final String errorMessage;

  CartCheckoutErrorState({required this.errorMessage});
}

class CartCheckoutSuccessState extends CartState {
  final String successMessage;

  CartCheckoutSuccessState({required this.successMessage});
}
