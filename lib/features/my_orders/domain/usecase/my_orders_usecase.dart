import 'package:dartz/dartz.dart';

import '../entities/order_entity.dart';
import '../repository/my_orders_repo.dart';

class MyOrdersUseCase {
  final MyOrdersRepo myOrdersRepo;

  MyOrdersUseCase(this.myOrdersRepo);

  Future<Either<String, List<OrderEntity>>> call() {
    return myOrdersRepo.getOrders();
  }
}
