import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/entities/product_entity.dart';
import 'product_card.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    super.key,
    required this.products,
    this.showAddToCart = false,
    this.shrinkWrap = false,
  });
  final List<ProductEntity> products;
  final bool showAddToCart;

  /// true when the grid is placed inside another scroll view (Home)
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: shrinkWrap,
      physics: shrinkWrap ? NeverScrollableScrollPhysics() : AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.h,
        crossAxisSpacing: 12.w,
        childAspectRatio: showAddToCart ? 0.6 : 0.75,
      ),
      itemBuilder: (context, index) {
        return ProductCard(product: products[index], showAddToCart: showAddToCart);
      },
    );
  }
}
