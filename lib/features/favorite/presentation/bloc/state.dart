abstract class FavoriteState {}

class FavoriteInitState extends FavoriteState {}

class FavoriteLoadingState extends FavoriteState {}

class FavoriteErrorState extends FavoriteState {
  final String errorMessage;

  FavoriteErrorState({required this.errorMessage});
}

class FavoriteSuccessState extends FavoriteState {}

/// Adding or removing a favorite failed; the list was restored
class FavoriteToggleErrorState extends FavoriteState {
  final String errorMessage;

  FavoriteToggleErrorState({required this.errorMessage});
}
