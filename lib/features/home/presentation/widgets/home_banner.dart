import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/theme/app_colors.dart';
import '../../../../core/utils/widgets/cached_image_network/custom_cached_image_network.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key, required this.onShopNow});
  final void Function() onShopNow;

  // Same Nike Air Max photo as the seeded product
  static const String _bannerImage =
      'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=600&q=80&fit=crop';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New Collection',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.onPrimary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Up to 50% Off',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.onPrimary.withValues(alpha: 0.8),
                  ),
                ),
                SizedBox(height: 14.h),
                GestureDetector(
                  onTap: onShopNow,
                  child: Container(
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
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          ClipRRect(
            borderRadius: BorderRadius.circular(14.r),
            child: CustomCachedImageNetwork(
              image: _bannerImage,
              height: 110.h,
              width: 130.w,
              // Show the old bag icon if the photo can't load
              errorWidget: Icon(
                Icons.shopping_bag_outlined,
                size: 90.sp,
                color: AppColors.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
