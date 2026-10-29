import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_palette.dart';

class CustomViewAll extends StatelessWidget {
  const CustomViewAll({super.key, required this.text, required this.onTapViewAll});
  final String text;
  final void Function() onTapViewAll;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              color: context.colors.textPrimary,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: onTapViewAll,
            child: Text(
              'View all',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
                color: context.colors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
