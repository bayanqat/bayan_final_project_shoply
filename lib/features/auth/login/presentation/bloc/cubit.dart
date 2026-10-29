import 'package:final_project_shoply/features/auth/login/presentation/bloc/state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/local/local_storage.dart';
import '../../../../../core/local/local_storage_user.dart';
import '../../data/datasource/login_remote_datasource.dart';
import '../../data/repository/login_repo_impl.dart';
import '../../domain/usecase/login_usecase.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitState());

  final _loginUseCase = LoginUseCase(LoginRepoImpl(LoginRemoteDataSource()));
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(LoginLoadingState());
      final result = await _loginUseCase(
        email: emailController.text,
        password: passwordController.text,
      );
      result.fold(
        (errorMessage) {
          emit(LoginErrorState(errorMessage: errorMessage));
        },
        (user) async {
          await LocalStorage.instance.setIsLogin(isLogin: true);
          await LocalStorageUser.instance.setUserData(user: user);
          LocalStorageUser.instance.setUserinfo(user: user);
          emit(LoginSuccessState());
        },
      );
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
