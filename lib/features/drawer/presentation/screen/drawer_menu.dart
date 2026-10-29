import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_pages.dart';
import '../../../../core/utils/theme/app_palette.dart';
import '../../../../core/utils/widgets/list_tile/custom_list_tile.dart';
import '../../../app/presentation/bloc/cubit.dart';
import '../widgets/drawer_user_header.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.colors.background,
      child: SafeArea(
        // Logout sits at the bottom on tall screens, and the menu scrolls on short
        // ones (a phone in landscape) instead of overflowing
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                child: Column(
                  children: [
                    DrawerUserHeader(),
                    SizedBox(height: 24.h),
                    CustomListTile(
                      title: 'My Orders',
                      iconData: Icons.receipt_long_outlined,
                      onTap: () => _openPage(context, AppPages.myOrdersScreen),
                    ),
                    CustomListTile(
                      title: 'Settings',
                      iconData: Icons.settings_outlined,
                      onTap: () => _openPage(context, AppPages.settingsScreen),
                    ),
                    CustomListTile(
                      title: 'About',
                      iconData: Icons.info_outline,
                      onTap: () => _openPage(context, AppPages.aboutScreen),
                    ),
                    Spacer(),
                    CustomListTile(
                      title: 'Logout',
                      iconData: Icons.logout,
                      color: context.colors.error,
                      onTap: () {
                        Navigator.pop(context);
                        context.read<AppCubit>().logout();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openPage(BuildContext context, String routeName) {
    // Close the drawer first so it is not open when the user comes back
    Navigator.pop(context);
    Navigator.pushNamed(context, routeName);
  }
}
