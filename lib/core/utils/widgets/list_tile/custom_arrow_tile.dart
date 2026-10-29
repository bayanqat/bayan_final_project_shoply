import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_palette.dart';

class CustomArrowTile extends StatelessWidget {
  const CustomArrowTile({super.key, required this.title, required this.iconData, this.onTap});
  final String title;
  final IconData iconData;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Row(
          children: [
            Icon(iconData, size: 26.sp, color: context.colors.icon),
            SizedBox(width: 14.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                  color: context.colors.textPrimary,
                ),
              ),
            ),
            Icon(Icons.chevron_right, size: 26.sp, color: context.colors.icon),
          ],
        ),
      ),
    );
  }
}
