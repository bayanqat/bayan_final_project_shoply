import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/widgets/app_bar/custom_app_bar.dart';
import '../../../../core/utils/widgets/button/custom_button.dart';
import '../../../../core/utils/widgets/dialog/custom_dialog_error.dart';
import '../../../../core/utils/widgets/dialog/custom_success_dialog.dart';
import '../../../../core/utils/widgets/empty_screen/empty_screen.dart';
import '../../../../core/utils/widgets/loading/custom_loading.dart';
import '../../../../core/utils/widgets/loading/custom_loading_data.dart';
import '../bloc/cubit.dart';
import '../bloc/state.dart';
import '../widgets/update_profile_avatar.dart';
import '../widgets/update_profile_fields.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileCubit()..getProfile(),
      child: Scaffold(
        appBar: CustomAppBar(titleText: 'Update Profile'),
        body: BlocListener<UpdateProfileCubit, UpdateProfileState>(
          listener: (context, state) {
            if (state is UpdateProfileLoadingState) {
              CustomLoading.showDialogLoading(context: context);
            } else if (state is UpdateProfileErrorState) {
              Navigator.pop(context);
              CustomDialogError.showProDialogError(
                context: context,
                title: 'Update Profile Error',
                description: state.errorMessage,
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            } else if (state is UpdateProfileSuccessState) {
              Navigator.pop(context);
              CustomSuccessDialog.showProSuccessDialog(
                context: context,
                title: 'Profile Updated',
                description: state.successMessage,
                onPressed: () {
                  // Close the dialog, then go back to Settings
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              );
            }
          },
          child: BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
            // Only loading the profile changes the page; saving uses dialogs
            buildWhen: (previous, current) {
              return current is UpdateProfileGetLoadingState ||
                  current is UpdateProfileGetErrorState ||
                  current is UpdateProfileGetSuccessState;
            },
            builder: (context, state) {
              final cubit = context.read<UpdateProfileCubit>();
              if (state is UpdateProfileInitState || state is UpdateProfileGetLoadingState) {
                return CustomLoadingData();
              } else if (state is UpdateProfileGetErrorState) {
                return EmptyScreen(emptyText: state.errorMessage);
              }
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 12.h),
                        UpdateProfileAvatar(),
                        SizedBox(height: 24.h),
                        UpdateProfileFields(),
                        SizedBox(height: 12.h),
                        CustomButton(
                          buttonText: 'Save Changes',
                          onPressed: () {
                            cubit.updateProfile();
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
