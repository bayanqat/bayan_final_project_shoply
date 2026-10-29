import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/price_format_helper.dart';
import '../../../../core/utils/theme/app_palette.dart';
import '../../../../core/utils/widgets/product_image/custom_product_image.dart';
import '../../../../core/utils/widgets/quantity/custom_quantity_counter.dart';
import '../../../../data/entities/cart_item_entity.dart';
import '../bloc/cubit.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.item});
  final CartItemEntity item;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();
    final productId = item.product.id ?? '';
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14.r),
            child: CustomProductImage(
              image: item.product.image,
              height: 90.r,
              width: 90.r,
              iconSize: 32.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: context.colors.textPrimary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  PriceFormatHelper.format(item.product.price),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                    color: context.colors.primary,
                  ),
                ),
                SizedBox(height: 10.h),
                CustomQuantityCounter(
                  quantity: item.quantity,
                  onIncrement: () {
                    cubit.updateQuantity(productId: productId, quantity: item.quantity + 1);
                  },
                  onDecrement: () {
                    cubit.updateQuantity(productId: productId, quantity: item.quantity - 1);
                  },
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              cubit.removeFromCart(productId: productId);
            },
            icon: Icon(Icons.delete_outline_outlined, size: 28.sp, color: context.colors.error),
          ),
        ],
      ),
    );
  }
}
