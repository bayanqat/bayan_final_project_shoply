import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_pages.dart';
import '../../../../core/utils/widgets/app_bar/custom_app_bar.dart';
import '../../../../core/utils/widgets/empty_screen/empty_screen.dart';
import '../../../../core/utils/widgets/loading/custom_loading_data.dart';
import '../../../../core/utils/widgets/refresh_indicator/custom_refresh_indicator.dart';
import '../../../../core/utils/widgets/view_all/custom_view_all.dart';
import '../../../main_shell/presentation/bloc/cubit.dart';
import '../../../products/presentation/widgets/products_grid.dart';
import '../bloc/cubit.dart';
import '../bloc/state.dart';
import '../widgets/home_banner.dart';
import '../widgets/home_categories_list.dart';
import '../../../../core/utils/theme/app_palette.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // This context is above Home's Scaffold, so Scaffold.of finds MainShell's
    // Scaffold, which owns the drawer and shows it over the bottom bar
    final shellContext = context;
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: Scaffold(
        appBar: CustomAppBar(
          titleText: 'Shoply',
          leading: IconButton(
            onPressed: () {
              Scaffold.of(shellContext).openDrawer();
            },
            icon: Icon(Icons.menu, size: 28.sp, color: context.colors.textPrimary),
          ),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final cubit = context.read<HomeCubit>();
            if (state is HomeErrorState) {
              return EmptyScreen(emptyText: state.errorMessage);
            } else if (state is HomeSuccessState) {
              return CustomRefreshIndicator(
                onRefresh: cubit.getHomeData,
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.w),
                      child: HomeBanner(onShopNow: () => _openAllProducts(context)),
                    ),
                    SizedBox(height: 20.h),
                    CustomViewAll(
                      text: 'Categories',
                      onTapViewAll: () {
                        context.read<MainShellCubit>().changeTab(1);
                      },
                    ),
                    SizedBox(height: 12.h),
                    HomeCategoriesList(categories: state.categories),
                    SizedBox(height: 12.h),
                    CustomViewAll(
                      text: 'Trending Products',
                      onTapViewAll: () => _openAllProducts(context),
                    ),
                    ProductsGrid(products: state.products, shrinkWrap: true),
                  ],
                ),
              );
            }
            return CustomLoadingData();
          },
        ),
      ),
    );
  }

  void _openAllProducts(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppPages.productsScreen,
      arguments: {'titleText': 'All Products', 'categoryId': null, 'context': context},
    );
  }
}
