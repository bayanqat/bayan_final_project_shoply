import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_pages.dart';
import '../../../../core/utils/widgets/app_bar/custom_app_bar.dart';
import '../../../../core/utils/widgets/list_tile/custom_arrow_tile.dart';
import '../widgets/dark_mode_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'Settings'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
        children: [
          CustomArrowTile(
            title: 'Update Profile',
            iconData: Icons.person_outline,
            onTap: () => Navigator.pushNamed(context, AppPages.updateProfileScreen),
          ),
          SizedBox(height: 12.h),
          CustomArrowTile(
            title: 'Update Password',
            iconData: Icons.lock_outline,
            onTap: () => Navigator.pushNamed(context, AppPages.changePasswordScreen),
          ),
          SizedBox(height: 12.h),
          DarkModeTile(),
          SizedBox(height: 12.h),
          CustomArrowTile(
            title: 'About',
            iconData: Icons.info_outline,
            onTap: () => Navigator.pushNamed(context, AppPages.aboutScreen),
          ),
        ],
      ),
    );
  }
}
