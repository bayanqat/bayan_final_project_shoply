import 'package:final_project_shoply/features/splash/presentation/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/local/local_storage.dart';
import '../../../../core/local/local_storage_user.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitState());

  void goNextPage() async {
    bool? isShowOnBoard = LocalStorage.instance.getShowOnBoard();
    bool? isLogin = LocalStorage.instance.getIsLogin();

    await Future.delayed(Duration(seconds: 1)).then((value) async {
      if (isShowOnBoard ?? false) {
        if (isLogin ?? false) {
          final responseLogin = await LocalStorageUser.instance.getUserData();
          LocalStorageUser.instance.setUserinfo(user: responseLogin);
          emit(SplashMainPageState());
        } else {
          emit(SplashLoginPageState());
        }
      } else {
        await LocalStorageUser.instance.clearUserData();
        emit(SplashOnBoardPageState());
      }
    });
  }
}
