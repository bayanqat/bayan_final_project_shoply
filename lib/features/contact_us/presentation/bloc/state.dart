abstract class ContactUsState {}

class ContactUsInitState extends ContactUsState {}

class ContactUsInfoLoadingState extends ContactUsState {}

class ContactUsInfoErrorState extends ContactUsState {
  final String errorMessage;

  ContactUsInfoErrorState({required this.errorMessage});
}

class ContactUsInfoSuccessState extends ContactUsState {}

class ContactUsSendLoadingState extends ContactUsState {}

class ContactUsSendErrorState extends ContactUsState {
  final String errorMessage;

  ContactUsSendErrorState({required this.errorMessage});
}

class ContactUsSendSuccessState extends ContactUsState {
  final String successMessage;

  ContactUsSendSuccessState({required this.successMessage});
}
