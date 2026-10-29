import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_palette.dart';

class CustomTextButtonWrap extends StatelessWidget {
  const CustomTextButtonWrap({super.key, required this.text, required this.textClick, this.onTap});
  final String text;
  final String textClick;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: context.colors.textSecondary,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            textClick,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: context.colors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
