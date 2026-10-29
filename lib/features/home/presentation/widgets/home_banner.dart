import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_pages.dart';
import '../../../../core/utils/theme/app_colors.dart';
import '../../../../core/utils/widgets/cached_image_network/custom_cached_image_network.dart';
import '../../../../core/utils/widgets/smooth_indicator/custom_smooth_indicator.dart';
import '../../../../data/entities/category_entity.dart';
import '../bloc/cubit.dart';

/// Slider with one slide per category; tapping a slide opens that category's products
class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key, required this.categories});
  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) return SizedBox.shrink();
    final cubit = context.read<HomeCubit>();
    return Column(
      children: [
        SizedBox(
          height: 160.h,
          child: PageView.builder(
            controller: cubit.bannerController,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: _BannerSlide(category: categories[index]),
              );
            },
          ),
        ),
        if (categories.length > 1) ...[
          SizedBox(height: 10.h),
          CustomSmoothIndicator(pageController: cubit.bannerController, count: categories.length),
        ],
      ],
    );
  }
}

class _BannerSlide extends StatelessWidget {
  const _BannerSlide({required this.category});
  final CategoryEntity category;

  void _openCategory(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppPages.productsScreen,
      arguments: {'titleText': category.name, 'categoryId': category.id, 'context': context},
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openCategory(context),
      child: Container(
        padding: EdgeInsets.all(18.r),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Row(
          children: [
            Expanded(
              // Shrinks the text a little instead of overflowing when the phone uses large text
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      category.name ?? '',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.onPrimary,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'New Collection · Up to 50% Off',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.onPrimary.withValues(alpha: 0.8),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: AppColors.onPrimary,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        'Shop Now',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 12.w),
            ClipRRect(
              borderRadius: BorderRadius.circular(14.r),
              child: CustomCachedImageNetwork(
                image: category.image ?? '',
                height: 110.h,
                width: 120.w,
                // Show a bag icon if the category has no image or it can't load
                errorWidget: Icon(
                  Icons.shopping_bag_outlined,
                  size: 80.sp,
                  color: AppColors.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
