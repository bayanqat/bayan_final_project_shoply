import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/utils/widgets/button/custom_button.dart';
import '../../../../../core/utils/widgets/text_button/custom_text_button_wrap.dart';
import '../bloc/cubit.dart';

class SignupBottom extends StatelessWidget {
  const SignupBottom({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return Column(
      children: [
        CustomButton(
          buttonText: 'Sign Up',
          onPressed: () {
            cubit.signup();
          },
        ),
        SizedBox(height: 25.h),
        CustomTextButtonWrap(
          text: 'Already have an account?',
          textClick: ' Login',
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(context, AppPages.loginScreen, (route) => false);
          },
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
