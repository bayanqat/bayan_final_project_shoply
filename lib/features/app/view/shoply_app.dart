import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/navigation/app_routes.dart';
import '../../../core/routes/app_pages.dart';
import '../../../core/utils/theme/app_palette.dart';
import '../../../core/utils/theme/app_theme.dart';
import '../../../core/utils/widgets/dialog/custom_dialog_error.dart';
import '../../../core/utils/widgets/loading/custom_loading.dart';
import '../presentation/bloc/cubit.dart';
import '../presentation/bloc/state.dart';
import '../../theme/presentation/bloc/cubit.dart';

class ShoplyApp extends StatelessWidget {
  const ShoplyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // The default (width) ignores minTextAdapt, so text grew over 2x on tablets
      // and phones in landscape; radius scales by the smaller of width and height
      fontSizeResolver: FontSizeResolvers.radius,
      builder: (context, child) {
        // App-level cubits: any screen can call context.read<AppCubit>().logout()
        // or context.read<ThemeCubit>().setDarkMode(...)
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AppCubit()),
            BlocProvider(create: (context) => ThemeCubit()),
          ],
          child: BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) => MaterialApp(
              title: 'Shoply App',
              navigatorKey: AppRoutes.navigatorKey,
              onGenerateRoute: AppRoutes.onGenerateRoute,
              initialRoute: AppPages.splashScreen,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.themeLight,
              darkTheme: AppTheme.themeDark,
              themeMode: themeMode,
              builder: (context, child) {
                // Status bar icons follow the theme on screens without an AppBar
                return AnnotatedRegion<SystemUiOverlayStyle>(
                  value: context.isDarkMode
                      ? SystemUiOverlayStyle.light
                      : SystemUiOverlayStyle.dark,
                  child: BlocListener<AppCubit, AppState>(
                    listener: (context, state) {
                      // This context is above the Navigator, so use the navigator key
                      final navigatorContext = AppRoutes.navigatorKey.currentContext!;
                      if (state is AppLogoutLoadingState) {
                        CustomLoading.showDialogLoading(context: navigatorContext);
                      } else if (state is AppLogoutErrorState) {
                        Navigator.pop(navigatorContext);
                        CustomDialogError.showProDialogError(
                          context: navigatorContext,
                          title: 'Logout Error',
                          description: state.errorMessage,
                          onPressed: () {
                            Navigator.pop(navigatorContext);
                          },
                        );
                      } else if (state is AppLogoutSuccessState) {
                        // Splash sees isLogin == false and sends the user to Login
                        AppRoutes.navigatorKey.currentState!.pushNamedAndRemoveUntil(
                          AppPages.splashScreen,
                          (route) => false,
                        );
                      }
                    },
                    child: child!,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
