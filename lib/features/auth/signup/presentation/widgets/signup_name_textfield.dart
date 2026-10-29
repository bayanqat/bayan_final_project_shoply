import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/widgets/textfield/custom_text_field.dart';
import '../bloc/cubit.dart';
import '../../../../../core/utils/theme/app_palette.dart';

class SignupNameTextfield extends StatelessWidget {
  const SignupNameTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();

    return Column(
      children: [
        CustomTextField(
          validator: (fullName) {
            if (fullName?.isEmpty ?? false) {
              return 'Full Name is required';
            }
            return null;
          },
          controller: cubit.fullNameController,
          hinText: 'Full Name',
          prefixIcon: Icon(Icons.person_outlined, size: 28, color: context.colors.icon),
        ),
        // SizedBox(height: 15),
        CustomTextField(
          validator: (userName) {
            if (userName?.isEmpty ?? false) {
              return 'Username is required';
            }
            return null;
          },
          controller: cubit.userNameController,
          hinText: 'Username',
          prefixIcon: Icon(Icons.person_outlined, size: 28, color: context.colors.icon),
        ),
      ],
    );
  }
}
