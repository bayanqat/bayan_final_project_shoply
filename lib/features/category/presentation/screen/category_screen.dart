import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_pages.dart';
import '../../../../core/utils/widgets/app_bar/custom_app_bar.dart';
import '../../../../core/utils/widgets/empty_screen/empty_screen.dart';
import '../../../../core/utils/widgets/loading/custom_loading_data.dart';
import '../../../../core/utils/widgets/refresh_indicator/custom_refresh_indicator.dart';
import '../bloc/cubit.dart';
import '../bloc/state.dart';
import '../widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..getCategories(),
      child: Scaffold(
        appBar: CustomAppBar(titleText: 'Categories'),
        body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            final cubit = context.read<CategoryCubit>();
            if (state is CategoryErrorState) {
              return EmptyScreen(emptyText: state.errorMessage);
            } else if (state is CategorySuccessState) {
              if (state.categories.isEmpty) {
                return EmptyScreen(emptyText: 'No categories yet');
              }
              return CustomRefreshIndicator(
                onRefresh: cubit.getCategories,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
                  itemCount: state.categories.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final category = state.categories[index];
                    return CategoryItem(
                      category: category,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppPages.productsScreen,
                          arguments: {
                            'titleText': category.name,
                            'categoryId': category.id,
                            'context': context,
                          },
                        );
                      },
                    );
                  },
                ),
              );
            }
            return CustomLoadingData();
          },
        ),
      ),
    );
  }
}
