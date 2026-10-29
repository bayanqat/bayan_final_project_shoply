import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/regex/app_regex.dart';
import '../../../../../core/utils/widgets/textfield/custom_text_field.dart';
import '../bloc/cubit.dart';
import '../../../../../core/utils/theme/app_palette.dart';

class SignupEmailAddressTextfield extends StatelessWidget {
  const SignupEmailAddressTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return Column(
      children: [
        CustomTextField(
          validator: (email) {
            if (email?.isEmpty ?? false) {
              return 'Email is required';
            } else if (AppRegex.emailRegex.hasMatch(email ?? '') == false) {
              return 'Email is not valid';
            }
            return null;
          },
          controller: cubit.emailController,
          hinText: 'Email',
          prefixIcon: Icon(Icons.email_outlined, size: 28, color: context.colors.icon),
        ),
        // SizedBox(height: 15),
        CustomTextField(
          validator: (address) {
            if (address?.isEmpty ?? false) {
              return 'Address is required';
            }
            return null;
          },
          controller: cubit.addressController,
          hinText: 'Address',
          prefixIcon: Icon(Icons.location_on_outlined, size: 28, color: context.colors.icon),
        ),
      ],
    );
  }
}
