import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/widgets/label/custom_field_label.dart';
import '../../../../core/utils/widgets/textfield/custom_text_field.dart';
import '../bloc/cubit.dart';
import '../../../../core/utils/theme/app_palette.dart';

class UpdateProfileFields extends StatelessWidget {
  const UpdateProfileFields({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UpdateProfileCubit>();
    return Column(
      children: [
        CustomFieldLabel(label: 'Full Name'),
        CustomTextField(
          validator: (fullName) {
            if (fullName?.trim().isEmpty ?? true) {
              return 'Full name is required';
            }
            return null;
          },
          controller: cubit.fullNameController,
          hinText: 'Full Name',
          prefixIcon: Icon(Icons.person_outline, size: 26.sp, color: context.colors.icon),
        ),
        CustomFieldLabel(label: 'Username'),
        CustomTextField(
          validator: (userName) {
            if (userName?.trim().isEmpty ?? true) {
              return 'Username is required';
            }
            return null;
          },
          controller: cubit.userNameController,
          hinText: 'Username',
          prefixIcon: Icon(Icons.person_outline, size: 26.sp, color: context.colors.icon),
        ),
        // Changing the email needs Firebase re-verification, so it is read-only here
        CustomFieldLabel(label: 'Email'),
        CustomTextField(
          readOnly: true,
          controller: cubit.emailController,
          hinText: 'Email',
          prefixIcon: Icon(Icons.email_outlined, size: 26.sp, color: context.colors.icon),
        ),
        CustomFieldLabel(label: 'Address'),
        CustomTextField(
          validator: (address) {
            if (address?.trim().isEmpty ?? true) {
              return 'Address is required';
            }
            return null;
          },
          controller: cubit.addressController,
          hinText: 'Address',
          prefixIcon: Icon(Icons.location_on_outlined, size: 26.sp, color: context.colors.icon),
        ),
      ],
    );
  }
}
