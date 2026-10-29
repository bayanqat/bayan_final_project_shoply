import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/widgets/app_bar/custom_app_bar.dart';
import '../../../../../core/utils/widgets/dialog/custom_dialog_error.dart';
import '../../../../../core/utils/widgets/dialog/custom_success_dialog.dart';
import '../../../../../core/utils/widgets/loading/custom_loading.dart';
import '../bloc/cubit.dart';
import '../bloc/state.dart';
import '../widgets/forgot_password_body.dart';
import '../widgets/forgot_password_bottom.dart';
import '../widgets/forgot_password_header.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(),
      child: Scaffold(
        appBar: CustomAppBar(),
        body: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
          listener: (context, state) {
            if (state is ForgotPasswordLoadingState) {
              CustomLoading.showDialogLoading(context: context);
            } else if (state is ForgotPasswordErrorState) {
              Navigator.pop(context);
              CustomDialogError.showProDialogError(
                context: context,
                title: 'Reset Password Error',
                description: state.errorMessage,
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            } else if (state is ForgotPasswordSuccessState) {
              Navigator.pop(context);
              CustomSuccessDialog.showProSuccessDialog(
                context: context,
                title: 'Check Your Email',
                description: state.successMessage,
                onPressed: () {
                  // Close the dialog, then go back to Login
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              );
            }
          },
          child: Builder(
            builder: (context) {
              final cubit = context.read<ForgotPasswordCubit>();
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Center(
                    child: Form(
                      key: cubit.formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 40.h),
                          ForgotPasswordHeader(),
                          SizedBox(height: 30.h),
                          ForgotPasswordBody(),
                          SizedBox(height: 10.h),
                          ForgotPasswordBottom(),
                        ],
                      ),
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
