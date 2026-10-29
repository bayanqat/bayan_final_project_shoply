import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/widgets/app_bar/custom_app_bar.dart';
import '../../../../core/utils/widgets/button/custom_button.dart';
import '../../../../core/utils/widgets/dialog/custom_dialog_error.dart';
import '../../../../core/utils/widgets/dialog/custom_success_dialog.dart';
import '../../../../core/utils/widgets/empty_screen/empty_screen.dart';
import '../../../../core/utils/widgets/header/custom_icon_header.dart';
import '../../../../core/utils/widgets/loading/custom_loading.dart';
import '../../../../core/utils/widgets/loading/custom_loading_data.dart';
import '../bloc/cubit.dart';
import '../bloc/state.dart';
import '../widgets/contact_email_card.dart';
import '../widgets/contact_us_fields.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactUsCubit()..getContactInfo(),
      child: Scaffold(
        appBar: CustomAppBar(titleText: 'Contact Us'),
        body: BlocConsumer<ContactUsCubit, ContactUsState>(
          listener: (context, state) {
            if (state is ContactUsSendLoadingState) {
              CustomLoading.showDialogLoading(context: context);
            } else if (state is ContactUsSendErrorState) {
              Navigator.pop(context);
              CustomDialogError.showProDialogError(
                context: context,
                title: 'Send Message Error',
                description: state.errorMessage,
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            } else if (state is ContactUsSendSuccessState) {
              Navigator.pop(context);
              CustomSuccessDialog.showProSuccessDialog(
                context: context,
                title: 'Message Sent',
                description: state.successMessage,
                onPressed: () {
                  // Close the dialog, then leave Contact Us
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              );
            }
          },
          // Sending is shown with dialogs, the form stays as it is
          buildWhen: (previous, current) {
            return current is ContactUsInfoLoadingState ||
                current is ContactUsInfoErrorState ||
                current is ContactUsInfoSuccessState;
          },
          builder: (context, state) {
            final cubit = context.read<ContactUsCubit>();
            if (state is ContactUsInfoErrorState) {
              return EmptyScreen(emptyText: state.errorMessage);
            } else if (state is ContactUsInfoSuccessState) {
              final info = cubit.contactInfo;
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    children: [
                      CustomIconHeader(
                        iconData: Icons.headset_mic_outlined,
                        title: info.title ?? 'How can we help?',
                        subtitle: info.subtitle,
                      ),
                      SizedBox(height: 18.h),
                      if (info.supportEmail != null) ...[
                        ContactEmailCard(email: info.supportEmail!),
                        SizedBox(height: 16.h),
                      ],
                      ContactUsFields(),
                      SizedBox(height: 8.h),
                      CustomButton(
                        buttonText: 'Send Message',
                        onPressed: () {
                          cubit.sendMessage();
                        },
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              );
            }
            return CustomLoadingData();
          },
        ),
      ),
    );
  }
}
