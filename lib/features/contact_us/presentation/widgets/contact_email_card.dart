import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/theme/app_palette.dart';

/// Support email; tapping it copies the address
class ContactEmailCard extends StatelessWidget {
  const ContactEmailCard({super.key, required this.email});
  final String email;

  Future<void> _copyEmail(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: email));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            'Email copied',
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: context.colors.onPrimary,
            ),
          ),
          backgroundColor: context.colors.primary,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _copyEmail(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Row(
          children: [
            Icon(Icons.email_outlined, size: 24.sp, color: context.colors.icon),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                email,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: context.colors.textPrimary,
                ),
              ),
            ),
            Icon(Icons.copy_rounded, size: 22.sp, color: context.colors.primary),
          ],
        ),
      ),
    );
  }
}
