import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/price_format_helper.dart';
import '../../../../core/routes/app_pages.dart';
import '../../../../core/utils/theme/app_palette.dart';
import '../../../../core/utils/widgets/button/custom_button.dart';
import '../../../../core/utils/widgets/product_image/custom_product_image.dart';
import '../../../../data/entities/product_entity.dart';
import '../../../cart/presentation/bloc/cubit.dart';
import '../../../favorite/presentation/widgets/favorite_button.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, this.showAddToCart = false});
  final ProductEntity product;
  final bool showAddToCart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppPages.productsDetailsScreen,
          arguments: {'product': product, 'context': context},
        );
      },
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14.r),
                      child: CustomProductImage(
                        image: product.image,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 4.h,
                    right: 4.w,
                    child: FavoriteButton(product: product),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              product.name ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: context.colors.textPrimary,
              ),
            ),
            Text(
              PriceFormatHelper.format(product.price),
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w800,
                color: context.colors.textPrimary,
              ),
            ),
            if (showAddToCart) ...[
              SizedBox(height: 8.h),
              CustomButton(
                buttonText: 'Add to Cart',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: context.colors.onPrimary,
                ),
                onPressed: () {
                  context.read<CartCubit>().addToCart(product: product, quantity: 1);
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
