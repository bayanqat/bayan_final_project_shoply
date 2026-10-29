import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../theme/app_palette.dart';

class CustomSmoothIndicator extends StatelessWidget {
  const CustomSmoothIndicator({
    super.key,
    required this.pageController,
    required this.count,
    this.effect,
  });
  final PageController pageController;
  final int count;
  final IndicatorEffect? effect;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: count,
      effect:
          effect ??
          WormEffect(
            spacing: 8.0.w,
            radius: 15.0.r,
            dotWidth: 12.0.r,
            dotHeight: 12.0.r,
            strokeWidth: 1.5,
            dotColor: context.colors.primary.withValues(alpha: 0.3),
            activeDotColor: context.colors.primary,
          ),
    );
  }
}
