import '../../../../data/entities/category_entity.dart';

abstract class CategoryState {}

class CategoryInitState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryErrorState extends CategoryState {
  final String errorMessage;

  CategoryErrorState({required this.errorMessage});
}

class CategorySuccessState extends CategoryState {
  final List<CategoryEntity> categories;

  CategorySuccessState({required this.categories});
}
