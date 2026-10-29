import 'package:final_project_shoply/features/auth/forgot_password/presentation/bloc/state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasource/forgot_password_remote_datasource.dart';
import '../../data/repository/forgot_password_repo_impl.dart';
import '../../domain/usecase/forgot_password_usecase.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitState());

  final _forgotPasswordUseCase = ForgotPasswordUseCase(
    ForgotPasswordRepoImpl(ForgotPasswordRemoteDataSource()),
  );
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> sendResetLink() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(ForgotPasswordLoadingState());
      final result = await _forgotPasswordUseCase(email: emailController.text.trim());
      result.fold(
        (errorMessage) {
          emit(ForgotPasswordErrorState(errorMessage: errorMessage));
        },
        (successMessage) {
          emit(ForgotPasswordSuccessState(successMessage: successMessage));
        },
      );
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
