import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_pages.dart';
import '../../../../core/utils/widgets/app_bar/custom_app_bar.dart';
import '../../../../core/utils/widgets/empty_screen/empty_screen.dart';
import '../../../../core/utils/widgets/list_tile/custom_arrow_tile.dart';
import '../../../../core/utils/widgets/loading/custom_loading_data.dart';
import '../bloc/cubit.dart';
import '../bloc/state.dart';
import '../widgets/about_header.dart';
import '../../../../core/utils/theme/app_palette.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AboutCubit()..getAbout(),
      child: Scaffold(
        appBar: CustomAppBar(titleText: 'About'),
        body: BlocBuilder<AboutCubit, AboutState>(
          builder: (context, state) {
            if (state is AboutErrorState) {
              return EmptyScreen(emptyText: state.errorMessage);
            } else if (state is AboutSuccessState) {
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
                children: [
                  AboutHeader(about: state.about),
                  SizedBox(height: 30.h),
                  CustomArrowTile(
                    title: 'Contact Us',
                    iconData: Icons.mail_outline,
                    onTap: () => Navigator.pushNamed(context, AppPages.contactUsScreen),
                  ),
                  SizedBox(height: 12.h),
                  CustomArrowTile(
                    title: 'Privacy Policy',
                    iconData: Icons.description_outlined,
                    onTap: () => Navigator.pushNamed(context, AppPages.privacyPolicyScreen),
                  ),
                  SizedBox(height: 12.h),
                  CustomArrowTile(
                    title: 'Terms & Conditions',
                    iconData: Icons.shield_outlined,
                    onTap: () => Navigator.pushNamed(context, AppPages.termsConditionsScreen),
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    state.about.footer ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: context.colors.textSecondary,
                    ),
                  ),
                ],
              );
            }
            return CustomLoadingData();
          },
        ),
      ),
    );
  }
}
