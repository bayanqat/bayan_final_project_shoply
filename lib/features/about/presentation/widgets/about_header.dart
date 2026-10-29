import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/images/app_images.dart';
import '../../domain/entities/about_entity.dart';
import '../../../../core/utils/theme/app_palette.dart';

class AboutHeader extends StatelessWidget {
  const AboutHeader({super.key, required this.about});
  final AboutEntity about;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage(
            context.isDarkMode ? AppImages.shoplySplashImageDark : AppImages.shoplySplashImage,
          ),
          height: 160.h,
          width: 220.w,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 8.h),
        Text(
          'Version ${about.version ?? ''}',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: context.colors.textSecondary,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          about.tagline ?? '',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: context.colors.icon,
          ),
        ),
      ],
    );
  }
}
