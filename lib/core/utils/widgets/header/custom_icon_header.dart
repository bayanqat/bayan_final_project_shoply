import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_palette.dart';

/// Icon in a circle with a title and subtitle, used at the top of form and content screens
class CustomIconHeader extends StatelessWidget {
  const CustomIconHeader({super.key, required this.iconData, required this.title, this.subtitle});
  final IconData iconData;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 110.r,
          width: 110.r,
          decoration: BoxDecoration(color: context.colors.primarySoft, shape: BoxShape.circle),
          child: Icon(iconData, size: 54.sp, color: context.colors.primary),
        ),
        SizedBox(height: 18.h),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w800,
            color: context.colors.textPrimary,
          ),
        ),
        if (subtitle != null) ...[
          SizedBox(height: 6.h),
          Text(
            subtitle!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: context.colors.textSecondary,
            ),
          ),
        ],
      ],
    );
  }
}
