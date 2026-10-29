import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/theme/app_palette.dart';
import '../../../../core/utils/widgets/cached_image_network/custom_cached_image_network.dart';
import '../../../../data/entities/category_entity.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category, this.onTap});
  final CategoryEntity category;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final image = category.image ?? '';
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: image.isEmpty
                  // Seeded categories have no image yet
                  ? Container(
                      height: 60.r,
                      width: 60.r,
                      color: context.colors.primarySoft,
                      child: Icon(
                        Icons.dashboard_outlined,
                        size: 30.sp,
                        color: context.colors.primary,
                      ),
                    )
                  : CustomCachedImageNetwork(image: image, height: 60.r, width: 60.r),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                category.name ?? '',
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                  color: context.colors.textPrimary,
                ),
              ),
            ),
            Icon(Icons.chevron_right, size: 28.sp, color: context.colors.icon),
          ],
        ),
      ),
    );
  }
}
