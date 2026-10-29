import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro_dialog/pro_dialog.dart';

import '../../../../core/utils/theme/app_palette.dart';
import '../../../../core/utils/widgets/dialog/custom_dialog.dart';
import '../../../app/presentation/bloc/cubit.dart';
import '../../../cart/presentation/bloc/cubit.dart';
import '../../../cart/presentation/bloc/state.dart';
import '../../../cart/presentation/screen/cart_screen.dart';
import '../../../category/presentation/screen/category_screen.dart';
import '../../../drawer/presentation/screen/drawer_menu.dart';
import '../../../favorite/presentation/bloc/cubit.dart';
import '../../../favorite/presentation/bloc/state.dart';
import '../../../favorite/presentation/screen/favorite_screen.dart';
import '../../../home/presentation/screen/home_screen.dart';
import '../bloc/cubit.dart';

class MainShell extends StatelessWidget {
  const MainShell({super.key});

  // Order must match the BottomNavigationBar items
  static const List<Widget> _tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainShellCubit, int>(
      builder: (context, currentIndex) {
        return PopScope(
          // false so the back press reaches onPopInvokedWithResult instead of closing the app
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
            // Back on another tab returns to Home, back on Home asks to log out
            if (currentIndex != 0) {
              context.read<MainShellCubit>().changeTab(0);
            } else {
              _showLogoutDialog(context);
            }
          },
          child: Scaffold(
            // Opened from Home's menu button; lives here so it covers the bottom bar
            drawer: DrawerMenu(),
            // IndexedStack keeps each tab's state alive when switching tabs
            body: _CartAndFavoriteListener(
              child: IndexedStack(index: currentIndex, children: _tabs),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: context.read<MainShellCubit>().changeTab,
              type: BottomNavigationBarType.fixed,
              backgroundColor: context.colors.background,
              selectedItemColor: context.colors.primary.withValues(alpha: 0.8),
              unselectedItemColor: context.colors.textSecondary,
              iconSize: 24.sp,
              selectedFontSize: 12.sp,
              unselectedFontSize: 12.sp,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard_outlined),
                  activeIcon: Icon(Icons.dashboard_rounded),
                  label: 'Category',
                ),
                BottomNavigationBarItem(
                  icon: _FavoriteNavIcon(iconData: Icons.favorite_border),
                  activeIcon: _FavoriteNavIcon(iconData: Icons.favorite),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: _CartNavIcon(iconData: Icons.shopping_cart_outlined),
                  activeIcon: _CartNavIcon(iconData: Icons.shopping_cart),
                  label: 'Cart',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    CustomDialog.showCustomProDialog(
      context: context,
      title: 'Logout',
      description: 'Are you sure you want to log out of Shoply?',
      dialogType: DialogType.warning,
      iconBackgroundColor: context.colors.primarySoft,
      iconColor: context.colors.primary,
      icon: Icons.logout,
      buttons: [
        DialogButton(
          text: 'Cancel',
          style: DialogButtonStyle.outlined,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        DialogButton(
          text: 'Logout',
          isPrimary: true,
          onPressed: () {
            Navigator.pop(context);
            context.read<AppCubit>().logout();
          },
        ),
      ],
    );
  }
}

/// One place for cart and favorite feedback, so a message shows once even when
/// several screens use the same cubit. Pushed screens show it too, since the
/// messenger is shared by the whole app.
class _CartAndFavoriteListener extends StatelessWidget {
  const _CartAndFavoriteListener({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CartCubit, CartState>(
          listener: (context, state) {
            if (state is CartAddSuccessState) {
              _showSnackBar(context, state.message);
            } else if (state is CartActionErrorState) {
              _showSnackBar(context, state.errorMessage);
            }
          },
        ),
        BlocListener<FavoriteCubit, FavoriteState>(
          listener: (context, state) {
            if (state is FavoriteToggleErrorState) {
              _showSnackBar(context, state.errorMessage);
            }
          },
        ),
      ],
      child: child,
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: context.colors.onPrimary,
            ),
          ),
          backgroundColor: context.colors.primary,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
        ),
      );
  }
}

/// Favorite tab icon with the number of products on the Favorites screen
class _FavoriteNavIcon extends StatelessWidget {
  const _FavoriteNavIcon({required this.iconData});
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final count = context.read<FavoriteCubit>().favorites.length;
        return _NavCountBadge(count: count, child: Icon(iconData));
      },
    );
  }
}

/// Cart tab icon with the number of products on the Cart screen
class _CartNavIcon extends StatelessWidget {
  const _CartNavIcon({required this.iconData});
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final count = context.read<CartCubit>().items.length;
        return _NavCountBadge(count: count, child: Icon(iconData));
      },
    );
  }
}

class _NavCountBadge extends StatelessWidget {
  const _NavCountBadge({required this.count, required this.child});
  final int count;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Badge(
      isLabelVisible: count > 0,
      backgroundColor: context.colors.primary,
      textColor: context.colors.onPrimary,
      textStyle: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
      label: Text(count > 99 ? '99+' : '$count'),
      child: child,
    );
  }
}
