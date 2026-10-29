import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/widgets/app_bar/custom_app_bar.dart';
import '../../../../core/utils/widgets/empty_screen/empty_screen.dart';
import '../../../../core/utils/widgets/loading/custom_loading_data.dart';
import '../../../../core/utils/widgets/refresh_indicator/custom_refresh_indicator.dart';
import '../bloc/cubit.dart';
import '../bloc/state.dart';
import '../widgets/products_grid.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, required this.titleText, this.categoryId});
  final String titleText;

  /// null shows products from every category
  final String? categoryId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..getProducts(categoryId: categoryId),
      child: Scaffold(
        appBar: CustomAppBar(titleText: titleText),
        body: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            final cubit = context.read<ProductsCubit>();
            if (state is ProductsErrorState) {
              return EmptyScreen(emptyText: state.errorMessage);
            } else if (state is ProductsSuccessState) {
              if (state.products.isEmpty) {
                return EmptyScreen(emptyText: 'No products yet');
              }
              return CustomRefreshIndicator(
                onRefresh: () => cubit.getProducts(categoryId: categoryId),
                child: ProductsGrid(products: state.products),
              );
            }
            return CustomLoadingData();
          },
        ),
      ),
    );
  }
}
