import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/widgets/app_bar/custom_app_bar.dart';
import '../../../../core/utils/widgets/empty_screen/empty_screen.dart';
import '../../../../core/utils/widgets/loading/custom_loading_data.dart';
import '../../../../core/utils/widgets/refresh_indicator/custom_refresh_indicator.dart';
import '../../../products/presentation/widgets/products_grid.dart';
import '../bloc/cubit.dart';
import '../bloc/state.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'Favorites'),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        // A failed heart tap is shown as a snackbar by MainShell, not here
        buildWhen: (previous, current) => current is! FavoriteToggleErrorState,
        builder: (context, state) {
          final cubit = context.read<FavoriteCubit>();
          if (state is FavoriteInitState || state is FavoriteLoadingState) {
            return CustomLoadingData();
          } else if (state is FavoriteErrorState) {
            return EmptyScreen(emptyText: state.errorMessage);
          } else if (cubit.favorites.isEmpty) {
            return EmptyScreen(emptyText: 'No favorites yet');
          }
          return CustomRefreshIndicator(
            onRefresh: cubit.getFavorites,
            child: ProductsGrid(products: cubit.favorites, showAddToCart: true),
          );
        },
      ),
    );
  }
}
