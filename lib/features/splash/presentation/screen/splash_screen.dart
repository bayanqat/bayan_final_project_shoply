import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_pages.dart';
import '../../../../core/utils/images/app_images.dart';
import '../../../../core/utils/theme/app_palette.dart';
import '../bloc/cubit.dart';
import '../bloc/state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..goNextPage(),
      child: Scaffold(
        body: BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is SplashOnBoardPageState) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppPages.onBoardingScreen,
                (route) => false,
              );
            } else if (state is SplashLoginPageState) {
              Navigator.pushNamedAndRemoveUntil(context, AppPages.loginScreen, (route) => false);
            } else if (state is SplashMainPageState) {
              Navigator.pushNamedAndRemoveUntil(context, AppPages.mainScreen, (route) => false);
            }
          },
          child: Center(
            child: Image(
              image: AssetImage(
                context.isDarkMode ? AppImages.shoplySplashImageDark : AppImages.shoplySplashImage,
              ),
              height: 350.r,
              width: 350.r,
            ),
          ),
        ),
      ),
    );
  }
}
