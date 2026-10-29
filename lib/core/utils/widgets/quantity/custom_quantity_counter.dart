import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_palette.dart';

class CustomQuantityCounter extends StatelessWidget {
  const CustomQuantityCounter({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });
  final int quantity;
  final void Function() onIncrement;
  final void Function() onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _counterButton(
          context: context,
          iconData: Icons.remove,
          onTap: quantity > 1 ? onDecrement : null,
        ),
        SizedBox(width: 14.w),
        Text(
          '$quantity',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: context.colors.textPrimary,
          ),
        ),
        SizedBox(width: 14.w),
        _counterButton(context: context, iconData: Icons.add, onTap: onIncrement),
      ],
    );
  }

  Widget _counterButton({
    required BuildContext context,
    required IconData iconData,
    required void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32.r,
        width: 32.r,
        decoration: BoxDecoration(
          color: context.colors.primarySoft,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Icon(
          iconData,
          size: 20.sp,
          color: onTap == null ? context.colors.textSecondary : context.colors.primary,
        ),
      ),
    );
  }
}
