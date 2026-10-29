import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/widgets/app_bar/custom_app_bar.dart';
import '../../../../core/utils/widgets/dialog/custom_dialog_error.dart';
import '../../../../core/utils/widgets/dialog/custom_success_dialog.dart';
import '../../../../core/utils/widgets/empty_screen/empty_screen.dart';
import '../../../../core/utils/widgets/loading/custom_loading.dart';
import '../../../../core/utils/widgets/loading/custom_loading_data.dart';
import '../../../../core/utils/widgets/refresh_indicator/custom_refresh_indicator.dart';
import '../bloc/cubit.dart';
import '../bloc/state.dart';
import '../widgets/cart_bottom.dart';
import '../widgets/cart_item_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'My Cart'),
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartCheckoutLoadingState) {
            CustomLoading.showDialogLoading(context: context);
          } else if (state is CartCheckoutErrorState) {
            Navigator.pop(context);
            CustomDialogError.showProDialogError(
              context: context,
              title: 'Checkout Error',
              description: state.errorMessage,
              onPressed: () {
                Navigator.pop(context);
              },
            );
          } else if (state is CartCheckoutSuccessState) {
            Navigator.pop(context);
            CustomSuccessDialog.showProSuccessDialog(
              context: context,
              title: 'Order Placed',
              description: state.successMessage,
              onPressed: () {
                Navigator.pop(context);
              },
            );
          }
        },
        buildWhen: (previous, current) {
          return current is! CartCheckoutLoadingState && current is! CartCheckoutErrorState;
        },
        builder: (context, state) {
          final cubit = context.read<CartCubit>();
          if (state is CartInitState || state is CartLoadingState) {
            return CustomLoadingData();
          } else if (state is CartErrorState) {
            return EmptyScreen(emptyText: state.errorMessage);
          } else if (cubit.items.isEmpty) {
            return EmptyScreen(emptyText: 'Your cart is empty');
          }
          return Column(
            children: [
              Expanded(
                child: CustomRefreshIndicator(
                  onRefresh: cubit.getCart,
                  child: ListView.separated(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
                    itemCount: cubit.items.length,
                    separatorBuilder: (context, index) => SizedBox(height: 12.h),
                    itemBuilder: (context, index) {
                      return CartItemCard(item: cubit.items[index]);
                    },
                  ),
                ),
              ),
              CartBottom(),
            ],
          );
        },
      ),
    );
  }
}
