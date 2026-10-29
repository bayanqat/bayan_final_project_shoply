import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_pages.dart';
import '../../../../core/utils/widgets/button/custom_button.dart';
import '../../../../core/utils/widgets/smooth_indicator/custom_smooth_indicator.dart';
import '../../../../core/utils/widgets/text_button/custom_text_button.dart';
import '../bloc/cubit.dart';
import '../bloc/state.dart';

class OnBoardingBottom extends StatelessWidget {
  const OnBoardingBottom({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
          buildWhen: (previous, current) {
            return current is OnBoardingChangeIndexState;
          },
          builder: (context, state) {
            final cubit = context.read<OnBoardingCubit>();
            return Column(
              children: [
                CustomSmoothIndicator(pageController: cubit.pageController, count: 3),
                SizedBox(height: 35.h),
                Column(
                  children: [
                    CustomButton(
                      buttonText: cubit.index != 2 ? 'Next' : 'Get Started',
                      onPressed: cubit.index != 2
                          ? () {
                              cubit.nextPageController();
                            }
                          : () {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                AppPages.loginScreen,
                                (route) => false,
                              );
                              cubit.setShowOnBoard();
                            },
                    ),
                    SizedBox(height: 20.h),
                    if (cubit.index != 2)
                      CustomTextButton(
                        onTap: () {
                          cubit.skipOnBoard();
                        },
                        textButton: 'Skip',
                      ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
