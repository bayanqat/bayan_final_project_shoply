import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/utils/theme/app_palette.dart';
import '../../../../../core/utils/widgets/textfield/custom_text_field.dart';
import '../bloc/cubit.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Column(
      children: [
        CustomTextField(
          validator: (email) {
            if (email?.isEmpty ?? false) {
              return 'Email is required';
            }
            return null;
          },
          controller: cubit.emailController,
          hinText: 'Email',
          prefixIcon: Icon(Icons.email_outlined, size: 26.sp, color: context.colors.icon),
        ),

        CustomTextField(
          validator: (password) {
            if (password?.isEmpty ?? false) {
              return 'Password is required';
            }
            return null;
          },
          obscureText: true,
          controller: cubit.passwordController,
          hinText: 'Password',
          prefixIcon: Icon(Icons.lock_outline, size: 28, color: context.colors.icon),
        ),
        SizedBox(height: 5.h),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppPages.forgotPasswordScreen);
          },
          child: Align(
            alignment: AlignmentGeometry.centerRight,
            child: Text(
              'ForgotPassword?',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: context.colors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
