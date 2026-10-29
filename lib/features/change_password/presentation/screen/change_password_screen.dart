import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/widgets/app_bar/custom_app_bar.dart';
import '../../../../core/utils/widgets/button/custom_button.dart';
import '../../../../core/utils/widgets/dialog/custom_dialog_error.dart';
import '../../../../core/utils/widgets/dialog/custom_success_dialog.dart';
import '../../../../core/utils/widgets/header/custom_icon_header.dart';
import '../../../../core/utils/widgets/loading/custom_loading.dart';
import '../bloc/cubit.dart';
import '../bloc/state.dart';
import '../widgets/change_password_fields.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: Scaffold(
        appBar: CustomAppBar(titleText: 'Change Password'),
        body: BlocListener<ChangePasswordCubit, ChangePasswordState>(
          listener: (context, state) {
            if (state is ChangePasswordLoadingState) {
              CustomLoading.showDialogLoading(context: context);
            } else if (state is ChangePasswordErrorState) {
              Navigator.pop(context);
              CustomDialogError.showProDialogError(
                context: context,
                title: 'Change Password Error',
                description: state.errorMessage,
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            } else if (state is ChangePasswordSuccessState) {
              Navigator.pop(context);
              CustomSuccessDialog.showProSuccessDialog(
                context: context,
                title: 'Password Updated',
                description: state.successMessage,
                onPressed: () {
                  // Close the dialog, then go back to Settings
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              );
            }
          },
          child: Builder(
            builder: (context) {
              final cubit = context.read<ChangePasswordCubit>();
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 12.h),
                        CustomIconHeader(
                          iconData: Icons.lock,
                          title: 'Keep your account secure',
                          subtitle: 'Update your password regularly to keep your account safe.',
                        ),
                        SizedBox(height: 24.h),
                        ChangePasswordFields(),
                        SizedBox(height: 20.h),
                        CustomButton(
                          buttonText: 'Update Password',
                          onPressed: () {
                            cubit.changePassword();
                          },
                        ),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
