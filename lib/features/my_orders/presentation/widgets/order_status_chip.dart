import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/theme/app_palette.dart';

class OrderStatusChip extends StatelessWidget {
  const OrderStatusChip({super.key, required this.status});
  final String status;

  @override
  Widget build(BuildContext context) {
    final isPending = status == 'pending';
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: isPending ? context.colors.warningBackground : context.colors.primarySoft,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        status.isEmpty ? '' : '${status[0].toUpperCase()}${status.substring(1)}',
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w700,
          color: isPending ? context.colors.warning : context.colors.primary,
        ),
      ),
    );
  }
}
