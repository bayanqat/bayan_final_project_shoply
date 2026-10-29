import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/entities/product_entity.dart';
import '../../features/about/presentation/screen/about_screen.dart';
import '../../features/auth/forgot_password/presentation/screen/forgot_password_screen.dart';
import '../../features/auth/login/presentation/screen/login_screen.dart';
import '../../features/auth/signup/presentation/screen/signup_screen.dart';
import '../../features/cart/presentation/bloc/cubit.dart';
import '../../features/change_password/presentation/screen/change_password_screen.dart';
import '../../features/contact_us/presentation/screen/contact_us_screen.dart';
import '../../features/favorite/presentation/bloc/cubit.dart';
import '../../features/legal/presentation/screen/privacy_policy_screen.dart';
import '../../features/legal/presentation/screen/terms_conditions_screen.dart';
import '../../features/main_shell/presentation/bloc/cubit.dart';
import '../../features/main_shell/presentation/screen/main_shell.dart';
import '../../features/my_orders/presentation/screen/my_orders_screen.dart';
import '../../features/notifications/presentation/screen/notifications_screen.dart';
import '../../features/onboarding/presentation/screen/on_boarding_screen.dart';
import '../../features/product_details/presentation/screen/product_details_screen.dart';
import '../../features/products/presentation/screen/products_screen.dart';
import '../../features/settings/presentation/screen/settings_screen.dart';
import '../../features/splash/presentation/screen/splash_screen.dart';
import '../../features/update_profile/presentation/screen/update_profile_screen.dart';
import '../routes/app_pages.dart';

class AppRoutes {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppPages.splashScreen:
        return MaterialPageRoute(
          builder: (context) {
            return SplashScreen();
          },
        );

      case AppPages.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) {
            return OnBoardingScreen();
          },
        );

      case AppPages.loginScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const LoginScreen();
          },
        );

      case AppPages.signupScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const SignupScreen();
          },
        );

      case AppPages.mainScreen:
        return MaterialPageRoute(
          builder: (context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => MainShellCubit()),
                // Shared by the tabs and the screens pushed from them
                BlocProvider(create: (context) => FavoriteCubit()..getFavorites()),
                BlocProvider(create: (context) => CartCubit()..getCart()),
              ],
              child: const MainShell(),
            );
          },
        );

      case AppPages.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const ForgotPasswordScreen();
          },
        );

      case AppPages.productsScreen:
        return _productsRoute(settings);

      case AppPages.productsDetailsScreen:
        return _productDetailsRoute(settings);

      case AppPages.settingsScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const SettingsScreen();
          },
        );

      case AppPages.updateProfileScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const UpdateProfileScreen();
          },
        );

      case AppPages.changePasswordScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const ChangePasswordScreen();
          },
        );

      case AppPages.aboutScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const AboutScreen();
          },
        );

      case AppPages.myOrdersScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const MyOrdersScreen();
          },
        );

      case AppPages.contactUsScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const ContactUsScreen();
          },
        );

      case AppPages.privacyPolicyScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const PrivacyPolicyScreen();
          },
        );

      case AppPages.termsConditionsScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const TermsConditionsScreen();
          },
        );

      case AppPages.notificationsScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const NotificationsScreen();
          },
        );
    }

    // Fallback for unknown route names
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(body: Center(child: Text('No route defined for ${settings.name}')));
      },
    );
  }

  /// arguments: titleText, categoryId (null for all products), context
  static Route _productsRoute(RouteSettings settings) {
    final arguments = settings.arguments as Map<String, dynamic>;
    final titleText = arguments['titleText'] as String? ?? '';
    final categoryId = arguments['categoryId'] as String?;
    final withMainCubits = _mainCubitsProvider(arguments['context'] as BuildContext);
    return MaterialPageRoute(
      builder: (context) {
        return withMainCubits(ProductsScreen(titleText: titleText, categoryId: categoryId));
      },
    );
  }

  /// arguments: product, context
  static Route _productDetailsRoute(RouteSettings settings) {
    final arguments = settings.arguments as Map<String, dynamic>;
    final product = arguments['product'] as ProductEntity;
    final withMainCubits = _mainCubitsProvider(arguments['context'] as BuildContext);
    return MaterialPageRoute(
      builder: (context) {
        return withMainCubits(ProductDetailsScreen(product: product));
      },
    );
  }

  /// Pushed routes are not inside MainShell, so they get its Favorite and Cart cubits here.
  /// The cubits are read now, while the caller's context is still mounted.
  static Widget Function(Widget child) _mainCubitsProvider(BuildContext context) {
    final favoriteCubit = context.read<FavoriteCubit>();
    final cartCubit = context.read<CartCubit>();
    return (child) {
      return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: favoriteCubit),
          BlocProvider.value(value: cartCubit),
        ],
        child: child,
      );
    };
  }
}
