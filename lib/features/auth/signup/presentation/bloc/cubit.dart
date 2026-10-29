import 'dart:io';

import 'package:final_project_shoply/features/auth/signup/presentation/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/image_picker_helper.dart';
import '../../../../../data/entities/user_entity.dart';
import '../../data/datasource/signup_remote_datasource.dart';
import '../../data/repository/signup_repo_impl.dart';
import '../../domain/usecase/signup_usecase.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitState());

  final _signupUseCase = SignupUseCase(SignupRepoImpl(SignupRemoteDataSource()));
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  File? image;

  Future<void> pickImage() async {
    final imageFile = await ImagePickerHelper.pickImageGallery();
    if (imageFile != null) {
      image = File(imageFile.path);
      emit(SingupPickImageState());
    }
  }

  void deleteImage() {
    image = null;
    emit(SingupRemoveImageState());
  }

  Future<void> signup() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(SignupLoadingState());
      final result = await _signupUseCase(
        image: image,
        password: passwordController.text,
        user: UserEntity(
          email: emailController.text,
          fullName: fullNameController.text,
          userName: userNameController.text,
          address: addressController.text,
        ),
      );
      result.fold(
        (errorMessage) {
          emit(SignupErrorState(errorMessage: errorMessage));
        },
        (_) {
          emit(SignupSuccessState(successMessage: 'User Register Successfully'));
        },
      );
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    fullNameController.dispose();
    userNameController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
