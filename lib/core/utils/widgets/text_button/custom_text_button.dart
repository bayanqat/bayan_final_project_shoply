import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/theme/app_palette.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, this.onTap, required this.textButton, this.style});
  final void Function()? onTap;
  final String textButton;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        textButton,
        style:
            style ??
            TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: context.colors.textSecondary,
            ),
      ),
    );
  }
}
