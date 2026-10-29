import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/utils/widgets/dialog/custom_dialog_error.dart';
import '../../../../../core/utils/widgets/loading/custom_loading.dart';
import '../bloc/cubit.dart';
import '../bloc/state.dart';
import '../widgets/login_body.dart';
import '../widgets/login_bottom.dart';
import '../widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginLoadingState) {
              CustomLoading.showDialogLoading(context: context);
            } else if (state is LoginErrorState) {
              Navigator.pop(context);
              CustomDialogError.showProDialogError(
                context: context,
                title: 'Login Error',
                description: state.errorMessage,
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            } else if (state is LoginSuccessState) {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(context, AppPages.mainScreen, (route) => false);
            }
          },
          child: Builder(
            builder: (context) {
              final cubit = context.read<LoginCubit>();
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Center(
                    child: Form(
                      key: cubit.formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 90.h),
                          LoginHeader(),
                          SizedBox(height: 30.h),
                          LoginBody(),
                          SizedBox(height: 30.h),
                          LoginBottom(),
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
