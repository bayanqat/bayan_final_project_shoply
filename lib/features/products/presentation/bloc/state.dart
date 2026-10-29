import '../../../../data/entities/product_entity.dart';

abstract class ProductsState {}

class ProductsInitState extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsErrorState extends ProductsState {
  final String errorMessage;

  ProductsErrorState({required this.errorMessage});
}

class ProductsSuccessState extends ProductsState {
  final List<ProductEntity> products;

  ProductsSuccessState({required this.products});
}
