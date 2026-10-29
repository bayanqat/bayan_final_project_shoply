import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit.dart';
import '../widgets/on_boarding_bottom.dart';
import '../widgets/on_boarding_header.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              OnBoardingHeader(),
              SizedBox(height: 20.h),
              OnBoardingBottom(),
            ],
          ),
        ),
      ),
    );
  }
}
