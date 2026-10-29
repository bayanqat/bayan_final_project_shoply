import 'dart:async';

import 'package:final_project_shoply/features/home/presentation/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../category/data/datasource/category_remote_datasource.dart';
import '../../../category/data/repository/category_repo_impl.dart';
import '../../../category/domain/usecase/category_usecase.dart';
import '../../../products/data/datasource/products_remote_datasource.dart';
import '../../../products/data/repository/products_repo_impl.dart';
import '../../../products/domain/usecase/products_usecase.dart';

/// Home reuses the category and products use cases instead of its own data layer
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitState());

  final _categoryUseCase = CategoryUseCase(CategoryRepoImpl(CategoryRemoteDataSource()));
  final _productsUseCase = ProductsUseCase(ProductsRepoImpl(ProductsRemoteDataSource()));

  static const int _trendingProductsCount = 6;

  Future<void> getHomeData() async {
    emit(HomeLoadingState());
    final (categoriesResult, productsResult) = await (
      _categoryUseCase(),
      _productsUseCase(limit: _trendingProductsCount),
    ).wait;
    categoriesResult.fold(
      (errorMessage) {
        emit(HomeErrorState(errorMessage: errorMessage));
      },
      (categories) {
        productsResult.fold(
          (errorMessage) {
            emit(HomeErrorState(errorMessage: errorMessage));
          },
          (products) {
            emit(HomeSuccessState(categories: categories, products: products));
          },
        );
      },
    );
  }
}
