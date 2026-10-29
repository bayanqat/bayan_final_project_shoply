import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/price_format_helper.dart';
import '../../../../core/utils/widgets/button/custom_button.dart';
import '../bloc/cubit.dart';
import '../../../../core/utils/theme/app_palette.dart';

class CartBottom extends StatelessWidget {
  const CartBottom({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();
    return Padding(
      padding: EdgeInsets.fromLTRB(18.w, 8.h, 18.w, 16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                  color: context.colors.textPrimary,
                ),
              ),
              Spacer(),
              Text(
                PriceFormatHelper.format(cubit.totalPrice),
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                  color: context.colors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          CustomButton(
            buttonText: 'Checkout',
            onPressed: () {
              cubit.checkout();
            },
          ),
        ],
      ),
    );
  }
}
