import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/price_format_helper.dart';
import '../../../../core/utils/theme/app_palette.dart';
import '../../../../data/entities/product_entity.dart';

class ProductDetailsInfo extends StatelessWidget {
  const ProductDetailsInfo({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name ?? '',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w800,
            color: context.colors.textPrimary,
          ),
        ),
        SizedBox(height: 6.h),
        Row(
          children: [
            Text(
              PriceFormatHelper.format(product.price),
              style: TextStyle(
                fontSize: 26.sp,
                fontWeight: FontWeight.w800,
                color: context.colors.primary,
              ),
            ),
            Spacer(),
            if (product.rating != null) ...[
              Icon(Icons.star_rounded, size: 22.sp, color: Colors.amber),
              SizedBox(width: 4.w),
              Text(
                '${product.rating} (${product.reviewsCount ?? 0})',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: context.colors.textSecondary,
                ),
              ),
            ],
          ],
        ),
        SizedBox(height: 12.h),
        Text(
          product.description ?? '',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: context.colors.textSecondary,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
