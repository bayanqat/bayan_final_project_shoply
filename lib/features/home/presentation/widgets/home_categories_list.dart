import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_pages.dart';
import '../../../../core/utils/widgets/product_image/custom_product_image.dart';
import '../../../../data/entities/category_entity.dart';
import '../../../../core/utils/theme/app_palette.dart';

class HomeCategoriesList extends StatelessWidget {
  const HomeCategoriesList({super.key, required this.categories});
  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        itemCount: categories.length,
        separatorBuilder: (context, index) => SizedBox(width: 16.w),
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppPages.productsScreen,
                arguments: {
                  'titleText': category.name,
                  'categoryId': category.id,
                  'context': context,
                },
              );
            },
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14.r),
                  child: CustomProductImage(
                    image: category.image,
                    height: 64.r,
                    width: 64.r,
                    iconSize: 28.sp,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  category.name ?? '',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: context.colors.textPrimary,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
