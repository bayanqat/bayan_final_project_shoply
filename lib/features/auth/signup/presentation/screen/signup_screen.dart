import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/utils/widgets/app_bar/custom_app_bar.dart';
import '../../../../../core/utils/widgets/dialog/custom_dialog_error.dart';
import '../../../../../core/utils/widgets/dialog/custom_success_dialog.dart';
import '../../../../../core/utils/widgets/loading/custom_loading.dart';
import '../bloc/cubit.dart';
import '../bloc/state.dart';
import '../widgets/signup_bottom.dart';
import '../widgets/signup_email_address_textfield.dart';
import '../widgets/signup_name_textfield.dart';
import '../widgets/signup_password_textfield.dart';
import '../widgets/singup_header.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: Scaffold(
        appBar: CustomAppBar(titleText: 'Create Account'),
        body: BlocListener<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupLoadingState) {
              CustomLoading.showDialogLoading(context: context);
            } else if (state is SignupErrorState) {
              Navigator.pop(context);
              CustomDialogError.showProDialogError(
                context: context,
                title: 'Sign Up Error',
                description: state.errorMessage,
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            } else if (state is SignupSuccessState) {
              Navigator.pop(context);
              CustomSuccessDialog.showProSuccessDialog(
                context: context,
                title: 'Sign Up Success',
                description: state.successMessage,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppPages.loginScreen,
                    (route) => false,
                  );
                },
              );
            }
          },
          child: Builder(
            builder: (context) {
              final cubit = context.read<SignupCubit>();
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Center(
                    child: Form(
                      key: cubit.formKey,
                      child: Column(
                        children: [
                          SingupHeader(),
                          SizedBox(height: 20.h),
                          SignupNameTextfield(),
                          SignupEmailAddressTextfield(),
                          SignupPasswordTextfield(),
                          SignupBottom(),
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
