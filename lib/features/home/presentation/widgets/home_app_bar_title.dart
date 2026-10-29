import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/theme/app_palette.dart';

/// "Shop" in the text color and "ly" in the brand green, like the logo
class HomeAppBarTitle extends StatelessWidget {
  const HomeAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w800);
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Shop',
            style: style.copyWith(color: context.colors.textPrimary),
          ),
          TextSpan(
            text: 'ly',
            style: style.copyWith(color: context.colors.primary),
          ),
        ],
      ),
    );
  }
}
