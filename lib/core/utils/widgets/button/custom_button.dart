import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_palette.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.buttonText, this.style, this.onPressed});
  final String buttonText;
  final TextStyle? style;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,

      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(18.r)),
          backgroundColor: context.colors.primary,
        ),
        child: Text(
          buttonText,
          style:
              style ??
              TextStyle(
                fontSize: 18.sp,
                color: context.colors.onPrimary,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }
}
