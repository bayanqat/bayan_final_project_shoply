import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/widgets/app_bar/custom_app_bar.dart';
import '../../../../core/utils/widgets/button/custom_button.dart';
import '../../../../core/utils/widgets/product_image/custom_product_image.dart';
import '../../../../core/utils/widgets/quantity/custom_quantity_counter.dart';
import '../../../../data/entities/product_entity.dart';
import '../../../cart/presentation/bloc/cubit.dart';
import '../../../favorite/presentation/widgets/favorite_button.dart';
import '../bloc/cubit.dart';
import '../widgets/product_details_info.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit(),
      child: Scaffold(
        appBar: CustomAppBar(
          actions: [FavoriteButton(product: product)],
          actionsPadding: EdgeInsets.only(right: 12.w),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18.r),
                child: CustomProductImage(
                  image: product.image,
                  height: 300.h,
                  width: double.infinity,
                  iconSize: 80.sp,
                ),
              ),
              SizedBox(height: 20.h),
              ProductDetailsInfo(product: product),
              SizedBox(height: 20.h),
              BlocBuilder<ProductDetailsCubit, int>(
                builder: (context, quantity) {
                  final cubit = context.read<ProductDetailsCubit>();
                  return CustomQuantityCounter(
                    quantity: quantity,
                    onIncrement: cubit.increment,
                    onDecrement: cubit.decrement,
                  );
                },
              ),
              SizedBox(height: 24.h),
              Builder(
                builder: (context) {
                  return CustomButton(
                    buttonText: 'Add to Cart',
                    onPressed: () {
                      context.read<CartCubit>().addToCart(
                        product: product,
                        quantity: context.read<ProductDetailsCubit>().state,
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
