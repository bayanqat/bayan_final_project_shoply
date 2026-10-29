import '../../../../core/utils/theme/app_palette.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.validator,
    required this.hinText,
    this.prefixIcon,
    this.obscureText,
    this.readOnly = false,
    this.maxLines = 1,
    this.keyboardType,
  });
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hinText;
  final Widget? prefixIcon;
  final bool? obscureText;
  final bool readOnly;
  final int maxLines;
  final TextInputType? keyboardType;

  @override
  State<CustomTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<CustomTextField> {
  bool? isHide;

  @override
  void initState() {
    isHide = widget.obscureText;
    super.initState();
  }

  void changeIsHide() {
    isHide = !(isHide ?? false);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isHide ?? false,
      controller: widget.controller,
      readOnly: widget.readOnly,
      // Obscured fields must stay on one line
      maxLines: (isHide ?? false) ? 1 : widget.maxLines,
      keyboardType: widget.keyboardType,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: context.colors.textPrimary,
      ),
      textInputAction: widget.maxLines > 1 ? TextInputAction.newline : TextInputAction.next,
      validator: widget.validator,
      cursorColor: context.colors.primary,
      cursorWidth: 2.2.w,
      decoration: InputDecoration(
        helperText: '',
        focusColor: context.colors.primary,
        helperStyle: TextStyle(fontSize: 12.sp),
        hintText: widget.hinText,
        hintStyle: TextStyle(color: context.colors.textSecondary, fontSize: 17.sp),
        suffixIcon: widget.obscureText == true
            ? GestureDetector(
                onTap: () {
                  changeIsHide();
                },
                child: isHide ?? false
                    ? Icon(Icons.visibility_off_outlined, size: 26.sp, color: context.colors.icon)
                    : Icon(Icons.visibility_outlined, size: 26.sp, color: context.colors.icon),
              )
            : null,
        contentPadding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 10.w),
        prefixIcon: widget.prefixIcon,
        fillColor: context.colors.surface,
        filled: true,
        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(18.r)),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.r),
          borderSide: BorderSide(color: context.colors.primary, width: 2.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.r),
          borderSide: BorderSide(color: context.colors.error, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.r),
          borderSide: BorderSide.none,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
