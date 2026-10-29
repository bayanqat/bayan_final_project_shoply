import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/date_format_helper.dart';
import '../../../../core/utils/theme/app_palette.dart';
import '../../domain/entities/notification_entity.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.notification});
  final NotificationEntity notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 44.r,
            width: 44.r,
            decoration: BoxDecoration(color: context.colors.primarySoft, shape: BoxShape.circle),
            child: Icon(
              notification.type == 'order' ? Icons.receipt_long_outlined : Icons.notifications_none,
              size: 24.sp,
              color: context.colors.primary,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title ?? '',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                    color: context.colors.textPrimary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  notification.body ?? '',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: context.colors.textSecondary,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  DateFormatHelper.shortDate(notification.createdAt),
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: context.colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          if (!notification.isRead)
            Container(
              margin: EdgeInsets.only(top: 6.h, left: 8.w),
              height: 10.r,
              width: 10.r,
              decoration: BoxDecoration(color: context.colors.primary, shape: BoxShape.circle),
            ),
        ],
      ),
    );
  }
}
