import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/theme/app_palette.dart';
import '../../../../data/entities/product_entity.dart';
import '../bloc/cubit.dart';
import '../bloc/state.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final cubit = context.read<FavoriteCubit>();
        final isFavorite = cubit.isFavorite(product.id);
        return GestureDetector(
          onTap: () {
            cubit.toggleFavorite(product);
          },
          child: Container(
            padding: EdgeInsets.all(6.r),
            decoration: BoxDecoration(color: context.colors.background, shape: BoxShape.circle),
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              size: 22.sp,
              color: context.colors.primary,
            ),
          ),
        );
      },
    );
  }
}
