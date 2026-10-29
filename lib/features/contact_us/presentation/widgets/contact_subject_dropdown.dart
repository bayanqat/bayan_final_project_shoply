import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/theme/app_palette.dart';
import '../bloc/cubit.dart';

class ContactSubjectDropdown extends StatelessWidget {
  const ContactSubjectDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContactUsCubit>();
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18.r),
      borderSide: BorderSide.none,
    );
    return DropdownButtonFormField<String>(
      initialValue: cubit.selectedSubject,
      onChanged: cubit.changeSubject,
      validator: (subject) {
        if (subject == null) {
          return 'Please choose a subject';
        }
        return null;
      },
      icon: Icon(Icons.keyboard_arrow_down, size: 26.sp, color: context.colors.icon),
      borderRadius: BorderRadius.circular(18.r),
      dropdownColor: context.colors.background,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: context.colors.textPrimary,
      ),
      hint: Text(
        'Choose a subject',
        style: TextStyle(color: context.colors.textSecondary, fontSize: 17.sp),
      ),
      // Matches CustomTextField
      decoration: InputDecoration(
        helperText: '',
        helperStyle: TextStyle(fontSize: 12.sp),
        contentPadding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 14.w),
        fillColor: context.colors.surface,
        filled: true,
        border: border,
        enabledBorder: border,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.r),
          borderSide: BorderSide(color: context.colors.primary, width: 2.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.r),
          borderSide: BorderSide(color: context.colors.error, width: 1),
        ),
      ),
      items: [
        for (final subject in cubit.contactInfo.subjects)
          DropdownMenuItem(value: subject, child: Text(subject)),
      ],
    );
  }
}
