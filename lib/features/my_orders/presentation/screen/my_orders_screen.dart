import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/widgets/app_bar/custom_app_bar.dart';
import '../../../../core/utils/widgets/empty_screen/empty_screen.dart';
import '../../../../core/utils/widgets/loading/custom_loading_data.dart';
import '../../../../core/utils/widgets/refresh_indicator/custom_refresh_indicator.dart';
import '../bloc/cubit.dart';
import '../bloc/state.dart';
import '../widgets/order_card.dart';
import '../widgets/orders_filter_tabs.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyOrdersCubit()..getOrders(),
      child: Scaffold(
        appBar: CustomAppBar(titleText: 'My Orders'),
        body: BlocBuilder<MyOrdersCubit, MyOrdersState>(
          builder: (context, state) {
            final cubit = context.read<MyOrdersCubit>();
            if (state is MyOrdersInitState || state is MyOrdersLoadingState) {
              return CustomLoadingData();
            } else if (state is MyOrdersErrorState) {
              return EmptyScreen(emptyText: state.errorMessage);
            }
            final orders = cubit.filteredOrders;
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                  child: OrdersFilterTabs(),
                ),
                Expanded(
                  child: orders.isEmpty
                      ? EmptyScreen(emptyText: 'No orders yet')
                      : CustomRefreshIndicator(
                          onRefresh: cubit.getOrders,
                          child: ListView.separated(
                            physics: AlwaysScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                            itemCount: orders.length,
                            separatorBuilder: (context, index) => SizedBox(height: 12.h),
                            itemBuilder: (context, index) => OrderCard(order: orders[index]),
                          ),
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
