import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/theme/app_palette.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key, required this.emptyText});
  final String emptyText;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        emptyText,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          color: context.colors.textPrimary,
        ),
      ),
    );
  }
}
