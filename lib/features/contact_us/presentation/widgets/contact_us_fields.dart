import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/regex/app_regex.dart';
import '../../../../core/utils/widgets/label/custom_field_label.dart';
import '../../../../core/utils/widgets/textfield/custom_text_field.dart';
import '../bloc/cubit.dart';
import 'contact_subject_dropdown.dart';

class ContactUsFields extends StatelessWidget {
  const ContactUsFields({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContactUsCubit>();
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
          hinText: 'Enter your name',
        ),
        CustomFieldLabel(label: 'Email'),
        CustomTextField(
          validator: (email) {
            if (email?.trim().isEmpty ?? true) {
              return 'Email is required';
            } else if (!AppRegex.emailRegex.hasMatch(email!.trim())) {
              return 'Please enter a valid email address';
            }
            return null;
          },
          keyboardType: TextInputType.emailAddress,
          controller: cubit.emailController,
          hinText: 'Enter your email',
        ),
        CustomFieldLabel(label: 'Subject'),
        ContactSubjectDropdown(),
        CustomFieldLabel(label: 'Message'),
        CustomTextField(
          validator: (message) {
            if (message?.trim().isEmpty ?? true) {
              return 'Message is required';
            }
            return null;
          },
          maxLines: 4,
          keyboardType: TextInputType.multiline,
          controller: cubit.messageController,
          hinText: 'Write your message...',
        ),
      ],
    );
  }
}
