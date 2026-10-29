import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/theme/app_palette.dart';
import '../bloc/cubit.dart';

class OrdersFilterTabs extends StatelessWidget {
  const OrdersFilterTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyOrdersCubit>();
    return Container(
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: context.colors.primarySoft,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: [
          for (final filter in OrdersFilter.values)
            Expanded(
              child: GestureDetector(
                onTap: () {
                  cubit.changeFilter(filter);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  decoration: BoxDecoration(
                    color: cubit.selectedFilter == filter
                        ? context.colors.primary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Text(
                    filter.label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: cubit.selectedFilter == filter
                          ? context.colors.onPrimary
                          : context.colors.textPrimary,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
