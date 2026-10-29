import 'package:final_project_shoply/features/products/presentation/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasource/products_remote_datasource.dart';
import '../../data/repository/products_repo_impl.dart';
import '../../domain/usecase/products_usecase.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitState());

  final _productsUseCase = ProductsUseCase(ProductsRepoImpl(ProductsRemoteDataSource()));

  Future<void> getProducts({String? categoryId}) async {
    emit(ProductsLoadingState());
    final result = await _productsUseCase(categoryId: categoryId);
    result.fold(
      (errorMessage) {
        emit(ProductsErrorState(errorMessage: errorMessage));
      },
      (products) {
        emit(ProductsSuccessState(products: products));
      },
    );
  }
}
