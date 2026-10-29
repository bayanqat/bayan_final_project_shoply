import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/theme/app_palette.dart';

class ForgotPasswordHeader extends StatelessWidget {
  const ForgotPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 130.r,
          width: 130.r,
          decoration: BoxDecoration(color: context.colors.primarySoft, shape: BoxShape.circle),
          child: Icon(Icons.lock, size: 60.sp, color: context.colors.primary),
        ),
        SizedBox(height: 24.h),
        Text(
          'Forgot Password?',
          style: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.w800,
            color: context.colors.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Enter your email and we\'ll send you a reset link.',
          textAlign: TextAlign.center,
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
