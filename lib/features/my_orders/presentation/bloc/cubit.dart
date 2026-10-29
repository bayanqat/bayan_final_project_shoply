import 'package:final_project_shoply/features/my_orders/presentation/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasource/my_orders_remote_datasource.dart';
import '../../data/repository/my_orders_repo_impl.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/usecase/my_orders_usecase.dart';

enum OrdersFilter {
  all('All'),
  active('Active'),
  completed('Completed');

  const OrdersFilter(this.label);
  final String label;
}

class MyOrdersCubit extends Cubit<MyOrdersState> {
  MyOrdersCubit() : super(MyOrdersInitState());

  final _myOrdersUseCase = MyOrdersUseCase(MyOrdersRepoImpl(MyOrdersRemoteDataSource()));

  List<OrderEntity> orders = [];
  OrdersFilter selectedFilter = OrdersFilter.all;

  List<OrderEntity> get filteredOrders {
    switch (selectedFilter) {
      case OrdersFilter.all:
        return orders;
      case OrdersFilter.active:
        return orders.where((order) => !order.isCompleted).toList();
      case OrdersFilter.completed:
        return orders.where((order) => order.isCompleted).toList();
    }
  }

  Future<void> getOrders() async {
    emit(MyOrdersLoadingState());
    final result = await _myOrdersUseCase();
    result.fold(
      (errorMessage) {
        emit(MyOrdersErrorState(errorMessage: errorMessage));
      },
      (myOrders) {
        orders = myOrders;
        emit(MyOrdersSuccessState());
      },
    );
  }

  void changeFilter(OrdersFilter filter) {
    selectedFilter = filter;
    emit(MyOrdersFilterChangedState());
  }
}
