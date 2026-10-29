import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/widgets/button/custom_button.dart';
import '../../../../../core/utils/widgets/text_button/custom_text_button.dart';
import '../bloc/cubit.dart';
import '../../../../../core/utils/theme/app_palette.dart';

class ForgotPasswordBottom extends StatelessWidget {
  const ForgotPasswordBottom({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();
    return Column(
      children: [
        CustomButton(
          buttonText: 'Send Reset Link',
          onPressed: () {
            cubit.sendResetLink();
          },
        ),
        SizedBox(height: 30.h),
        CustomTextButton(
          textButton: 'Back to Login',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: context.colors.textPrimary,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
