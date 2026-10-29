import 'package:final_project_shoply/features/favorite/presentation/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/entities/product_entity.dart';
import '../../data/datasource/favorite_remote_datasource.dart';
import '../../data/repository/favorite_repo_impl.dart';
import '../../domain/usecase/favorite_usecase.dart';

/// Shared by every screen that shows a heart, provided on the main screen route
class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitState());

  final _favoriteUseCase = FavoriteUseCase(FavoriteRepoImpl(FavoriteRemoteDataSource()));

  List<ProductEntity> favorites = [];

  bool isFavorite(String? productId) {
    return favorites.any((product) => product.id == productId);
  }

  Future<void> getFavorites() async {
    emit(FavoriteLoadingState());
    final result = await _favoriteUseCase.getFavorites();
    result.fold(
      (errorMessage) {
        emit(FavoriteErrorState(errorMessage: errorMessage));
      },
      (products) {
        favorites = products;
        emit(FavoriteSuccessState());
      },
    );
  }

  Future<void> toggleFavorite(ProductEntity product) async {
    final productId = product.id ?? '';
    final previousFavorites = favorites;
    final wasFavorite = isFavorite(productId);

    // Update the heart right away, then save to Firestore
    favorites = wasFavorite
        ? favorites.where((favorite) => favorite.id != productId).toList()
        : [product, ...favorites];
    emit(FavoriteSuccessState());

    final result = wasFavorite
        ? await _favoriteUseCase.removeFavorite(productId: productId)
        : await _favoriteUseCase.addFavorite(productId: productId);
    result.fold((errorMessage) {
      favorites = previousFavorites;
      emit(FavoriteToggleErrorState(errorMessage: errorMessage));
    }, (_) {});
  }
}
