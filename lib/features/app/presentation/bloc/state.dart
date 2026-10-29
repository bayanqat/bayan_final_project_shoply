abstract class AppState {}

class AppInitState extends AppState {}

class AppLogoutLoadingState extends AppState {}

class AppLogoutErrorState extends AppState {
  final String errorMessage;

  AppLogoutErrorState({required this.errorMessage});
}

class AppLogoutSuccessState extends AppState {}
