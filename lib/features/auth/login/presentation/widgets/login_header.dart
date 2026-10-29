import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/images/app_images.dart';
import '../../../../../core/utils/theme/app_palette.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage(
            context.isDarkMode ? AppImages.shoplySplashImageDark : AppImages.shoplySplashImage,
          ),
          height: 180.h,
          width: 240.w,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 10.h),
        Text(
          'Welcom Back',
          style: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.w800,
            color: context.colors.textPrimary,
          ),
        ),
        Text(
          'Sign to countinue shopping',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: context.colors.textSecondary,
          ),
        ),
      ],
    );
  }
}
