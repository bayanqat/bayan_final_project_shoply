import 'dart:io';

import 'package:final_project_shoply/features/update_profile/presentation/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/image_picker_helper.dart';
import '../../../../core/local/local_storage_user.dart';
import '../../../../data/entities/user_entity.dart';
import '../../../../data/service/firestore_service.dart';
import '../../data/datasource/update_profile_remote_datasource.dart';
import '../../data/repository/update_profile_repo_impl.dart';
import '../../domain/usecase/update_profile_usecase.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitState());

  final _updateProfileUseCase = UpdateProfileUseCase(
    UpdateProfileRepoImpl(UpdateProfileRemoteDataSource()),
  );
  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  File? image;
  String profileImage = '';

  /// Fills the form from Firestore, so it is right even if the copy on the phone is empty
  Future<void> getProfile() async {
    emit(UpdateProfileGetLoadingState());
    final result = await _updateProfileUseCase.getProfile();
    await result.fold(
      (errorMessage) async {
        emit(UpdateProfileGetErrorState(errorMessage: errorMessage));
      },
      (user) async {
        fullNameController.text = user.fullName ?? '';
        userNameController.text = user.userName ?? '';
        emailController.text = user.email ?? '';
        addressController.text = user.address ?? '';
        profileImage = user.profileImage ?? '';
        // Keep the drawer in sync with Firestore
        await LocalStorageUser.instance.setUserData(user: user);
        LocalStorageUser.instance.setUserinfo(user: user);
        emit(UpdateProfileGetSuccessState());
      },
    );
  }

  Future<void> pickImage() async {
    final imageFile = await ImagePickerHelper.pickImageGallery();
    if (imageFile != null) {
      image = File(imageFile.path);
      emit(UpdateProfilePickImageState());
    }
  }

  Future<void> updateProfile() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(UpdateProfileLoadingState());
      final result = await _updateProfileUseCase(
        image: image,
        user: UserEntity(
          uid: FirestoreService.currentUid(),
          email: emailController.text,
          fullName: fullNameController.text.trim(),
          userName: userNameController.text.trim(),
          address: addressController.text.trim(),
          profileImage: profileImage,
        ),
      );
      await result.fold(
        (errorMessage) async {
          emit(UpdateProfileErrorState(errorMessage: errorMessage));
        },
        (user) async {
          await LocalStorageUser.instance.setUserData(user: user);
          LocalStorageUser.instance.setUserinfo(user: user);
          profileImage = user.profileImage ?? '';
          image = null;
          emit(UpdateProfileSuccessState(successMessage: 'Your profile has been updated.'));
        },
      );
    }
  }

  @override
  Future<void> close() {
    fullNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    addressController.dispose();
    return super.close();
  }
}
