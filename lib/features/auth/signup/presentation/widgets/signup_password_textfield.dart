import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/regex/app_regex.dart';
import '../../../../../core/utils/widgets/textfield/custom_text_field.dart';
import '../bloc/cubit.dart';
import '../../../../../core/utils/theme/app_palette.dart';

class SignupPasswordTextfield extends StatelessWidget {
  const SignupPasswordTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();

    return Column(
      children: [
        CustomTextField(
          validator: (password) {
            if (password?.isEmpty ?? false) {
              return 'Password is required';
            } else if (password!.length < 6) {
              return 'Password must be at least 6 characters';
            } else if (AppRegex.passwordRegex.hasMatch(password) == false) {
              return 'Password must contain at least one uppercase letter and one special character';
            }
            return null;
          },
          obscureText: true,
          controller: cubit.passwordController,
          hinText: 'Password',
          prefixIcon: Icon(Icons.lock_outline, size: 28, color: context.colors.icon),
        ),
        // SizedBox(height: 15),
        CustomTextField(
          validator: (confirmPassword) {
            if (confirmPassword?.isEmpty ?? false) {
              return 'Confirm Password is required';
            } else if (confirmPassword != cubit.passwordController.text) {
              return 'Password do not match';
            }
            return null;
          },
          obscureText: true,
          controller: cubit.confirmPasswordController,
          hinText: 'Confirm Password',
          prefixIcon: Icon(Icons.lock_outline, size: 28, color: context.colors.icon),
        ),
      ],
    );
  }
}
