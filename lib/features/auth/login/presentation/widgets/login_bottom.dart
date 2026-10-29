import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/utils/widgets/button/custom_button.dart';
import '../../../../../core/utils/widgets/text_button/custom_text_button_wrap.dart';
import '../bloc/cubit.dart';

class LoginBottom extends StatelessWidget {
  const LoginBottom({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Column(
      children: [
        CustomButton(
          buttonText: 'Login',
          onPressed: () {
            cubit.login();
          },
        ),
        SizedBox(height: 40.h),
        CustomTextButtonWrap(
          text: 'Don\'t have an account?',
          textClick: ' Sign Up',
          onTap: () {
            Navigator.pushNamed(context, AppPages.signupScreen);
          },
        ),
      ],
    );
  }
}
