import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/regex/app_regex.dart';
import '../../../../core/utils/widgets/label/custom_field_label.dart';
import '../../../../core/utils/widgets/textfield/custom_text_field.dart';
import '../bloc/cubit.dart';
import '../../../../core/utils/theme/app_palette.dart';

class ChangePasswordFields extends StatelessWidget {
  const ChangePasswordFields({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChangePasswordCubit>();
    return Column(
      children: [
        CustomFieldLabel(label: 'Current Password'),
        CustomTextField(
          validator: (password) {
            if (password?.isEmpty ?? true) {
              return 'Current password is required';
            }
            return null;
          },
          obscureText: true,
          controller: cubit.currentPasswordController,
          hinText: 'Current Password',
          prefixIcon: Icon(Icons.lock_outline, size: 26.sp, color: context.colors.icon),
        ),
        CustomFieldLabel(label: 'New Password'),
        // Same rules as Sign Up
        CustomTextField(
          validator: (password) {
            if (password?.isEmpty ?? true) {
              return 'New password is required';
            } else if (password!.length < 6) {
              return 'Password must be at least 6 characters';
            } else if (AppRegex.passwordRegex.hasMatch(password) == false) {
              return 'Password must contain at least one uppercase letter and one special character';
            } else if (password == cubit.currentPasswordController.text) {
              return 'New password must be different from the current one';
            }
            return null;
          },
          obscureText: true,
          controller: cubit.newPasswordController,
          hinText: 'New Password',
          prefixIcon: Icon(Icons.lock_outline, size: 26.sp, color: context.colors.icon),
        ),
        CustomFieldLabel(label: 'Confirm New Password'),
        CustomTextField(
          validator: (confirmPassword) {
            if (confirmPassword?.isEmpty ?? true) {
              return 'Confirm password is required';
            } else if (confirmPassword != cubit.newPasswordController.text) {
              return 'Password do not match';
            }
            return null;
          },
          obscureText: true,
          controller: cubit.confirmPasswordController,
          hinText: 'Confirm New Password',
          prefixIcon: Icon(Icons.lock_outline, size: 26.sp, color: context.colors.icon),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Use at least 6 characters, one uppercase letter and one special character.',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: context.colors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
