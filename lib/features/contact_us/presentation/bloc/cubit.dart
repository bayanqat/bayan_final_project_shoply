import 'package:final_project_shoply/features/contact_us/presentation/bloc/state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/local/local_storage_user.dart';
import '../../data/datasource/contact_us_remote_datasource.dart';
import '../../data/repository/contact_us_repo_impl.dart';
import '../../domain/entities/contact_info_entity.dart';
import '../../domain/usecase/contact_us_usecase.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsInitState());

  final _contactUsUseCase = ContactUsUseCase(ContactUsRepoImpl(ContactUsRemoteDataSource()));
  final fullNameController = TextEditingController(text: LocalStorageUser.instance.fullName);
  final emailController = TextEditingController(text: LocalStorageUser.instance.email);
  final messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  ContactInfoEntity contactInfo = ContactInfoEntity();
  String? selectedSubject;

  Future<void> getContactInfo() async {
    emit(ContactUsInfoLoadingState());
    final result = await _contactUsUseCase.getContactInfo();
    result.fold(
      (errorMessage) {
        emit(ContactUsInfoErrorState(errorMessage: errorMessage));
      },
      (info) {
        contactInfo = info;
        emit(ContactUsInfoSuccessState());
      },
    );
  }

  void changeSubject(String? subject) {
    selectedSubject = subject;
  }

  Future<void> sendMessage() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(ContactUsSendLoadingState());
      final result = await _contactUsUseCase.sendMessage(
        fullName: fullNameController.text.trim(),
        email: emailController.text.trim(),
        subject: selectedSubject ?? '',
        message: messageController.text.trim(),
      );
      result.fold(
        (errorMessage) {
          emit(ContactUsSendErrorState(errorMessage: errorMessage));
        },
        (successMessage) {
          emit(ContactUsSendSuccessState(successMessage: successMessage));
        },
      );
    }
  }

  @override
  Future<void> close() {
    fullNameController.dispose();
    emailController.dispose();
    messageController.dispose();
    return super.close();
  }
}
