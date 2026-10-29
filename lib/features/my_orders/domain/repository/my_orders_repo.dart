import 'package:dartz/dartz.dart';

import '../entities/order_entity.dart';

abstract class MyOrdersRepo {
  Future<Either<String, List<OrderEntity>>> getOrders();
}
