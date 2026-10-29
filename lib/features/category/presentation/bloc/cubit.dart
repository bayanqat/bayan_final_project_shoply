import 'package:final_project_shoply/features/category/presentation/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasource/category_remote_datasource.dart';
import '../../data/repository/category_repo_impl.dart';
import '../../domain/usecase/category_usecase.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitState());

  final _categoryUseCase = CategoryUseCase(CategoryRepoImpl(CategoryRemoteDataSource()));

  Future<void> getCategories() async {
    emit(CategoryLoadingState());
    final result = await _categoryUseCase();
    result.fold(
      (errorMessage) {
        emit(CategoryErrorState(errorMessage: errorMessage));
      },
      (categories) {
        emit(CategorySuccessState(categories: categories));
      },
    );
  }
}
