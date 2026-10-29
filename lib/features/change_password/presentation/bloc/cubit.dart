import 'package:final_project_shoply/features/change_password/presentation/bloc/state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasource/change_password_remote_datasource.dart';
import '../../data/repository/change_password_repo_impl.dart';
import '../../domain/usecase/change_password_usecase.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitState());

  final _changePasswordUseCase = ChangePasswordUseCase(
    ChangePasswordRepoImpl(ChangePasswordRemoteDataSource()),
  );
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> changePassword() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(ChangePasswordLoadingState());
      final result = await _changePasswordUseCase(
        currentPassword: currentPasswordController.text,
        newPassword: newPasswordController.text,
      );
      result.fold(
        (errorMessage) {
          emit(ChangePasswordErrorState(errorMessage: errorMessage));
        },
        (successMessage) {
          emit(ChangePasswordSuccessState(successMessage: successMessage));
        },
      );
    }
  }

  @override
  Future<void> close() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
