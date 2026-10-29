import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/theme/app_palette.dart';
import '../../../theme/presentation/bloc/cubit.dart';

class DarkModeTile extends StatelessWidget {
  const DarkModeTile({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 8.w, top: 6.h, bottom: 6.h),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Row(
        children: [
          Icon(
            isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            size: 26.sp,
            color: context.colors.icon,
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Text(
              'Dark Mode',
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
                color: context.colors.textPrimary,
              ),
            ),
          ),
          Switch(
            value: isDark,
            activeThumbColor: context.colors.onPrimary,
            activeTrackColor: context.colors.primary,
            onChanged: (value) {
              context.read<ThemeCubit>().setDarkMode(value);
            },
          ),
        ],
      ),
    );
  }
}
