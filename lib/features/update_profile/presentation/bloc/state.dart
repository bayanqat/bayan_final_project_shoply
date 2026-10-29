abstract class UpdateProfileState {}

class UpdateProfileInitState extends UpdateProfileState {}

class UpdateProfileGetLoadingState extends UpdateProfileState {}

class UpdateProfileGetErrorState extends UpdateProfileState {
  final String errorMessage;

  UpdateProfileGetErrorState({required this.errorMessage});
}

class UpdateProfileGetSuccessState extends UpdateProfileState {}

class UpdateProfileLoadingState extends UpdateProfileState {}

class UpdateProfileErrorState extends UpdateProfileState {
  final String errorMessage;

  UpdateProfileErrorState({required this.errorMessage});
}

class UpdateProfileSuccessState extends UpdateProfileState {
  final String successMessage;

  UpdateProfileSuccessState({required this.successMessage});
}

class UpdateProfilePickImageState extends UpdateProfileState {}
