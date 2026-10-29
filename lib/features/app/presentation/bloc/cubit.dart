import 'package:final_project_shoply/features/app/presentation/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/local/local_storage.dart';
import '../../../../core/local/local_storage_user.dart';
import '../../data/datasource/logout_remote_datasource.dart';
import '../../data/repository/logout_repo_impl.dart';
import '../../domain/usecase/logout_usecase.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitState());

  final _logoutUsecase = LogoutUsecase(LogoutRepoImpl(LogoutRemoteDataSource()));

  Future<void> logout() async {
    emit(AppLogoutLoadingState());
    final result = await _logoutUsecase();
    await result.fold(
      (errorMessage) async {
        emit(AppLogoutErrorState(errorMessage: errorMessage));
      },
      (_) async {
        await LocalStorage.instance.setIsLogin(isLogin: false);
        await LocalStorageUser.instance.clearUserData();
        emit(AppLogoutSuccessState());
      },
    );
  }
}
