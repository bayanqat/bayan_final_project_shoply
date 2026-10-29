import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/regex/app_regex.dart';
import '../../../../../core/utils/widgets/textfield/custom_text_field.dart';
import '../bloc/cubit.dart';
import '../../../../../core/utils/theme/app_palette.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();

    return CustomTextField(
      validator: (email) {
        if (email?.trim().isEmpty ?? true) {
          return 'Email is required';
        }
        if (!AppRegex.emailRegex.hasMatch(email!.trim())) {
          return 'Please enter a valid email address';
        }
        return null;
      },
      controller: cubit.emailController,
      hinText: 'Email',
      prefixIcon: Icon(Icons.email_outlined, size: 26.sp, color: context.colors.icon),
    );
  }
}
