import '../../../../data/entities/category_entity.dart';
import '../../../../data/entities/product_entity.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String errorMessage;

  HomeErrorState({required this.errorMessage});
}

class HomeSuccessState extends HomeState {
  final List<CategoryEntity> categories;
  final List<ProductEntity> products;

  HomeSuccessState({required this.categories, required this.products});
}
