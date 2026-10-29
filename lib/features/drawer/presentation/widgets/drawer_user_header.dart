import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/local/local_storage_user.dart';
import '../../../../core/helper/profile_image_helper.dart';
import '../../../../core/utils/theme/app_palette.dart';

class DrawerUserHeader extends StatelessWidget {
  const DrawerUserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final user = LocalStorageUser.instance;
    return Row(
      children: [
        CircleAvatar(
          radius: 32.r,
          backgroundColor: Colors.transparent,
          backgroundImage: ProfileImageHelper.provider(user.profileImage),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.fullName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                  color: context.colors.textPrimary,
                ),
              ),
              Text(
                user.email,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: context.colors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
