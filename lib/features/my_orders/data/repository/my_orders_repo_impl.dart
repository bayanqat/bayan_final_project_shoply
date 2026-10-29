import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/order_entity.dart';
import '../../domain/repository/my_orders_repo.dart';
import '../datasource/my_orders_remote_datasource.dart';

class MyOrdersRepoImpl implements MyOrdersRepo {
  final MyOrdersRemoteDataSource myOrdersRemoteDataSource;

  MyOrdersRepoImpl(this.myOrdersRemoteDataSource);

  @override
  Future<Either<String, List<OrderEntity>>> getOrders() async {
    try {
      final orders = await myOrdersRemoteDataSource.getOrders();
      return Right(orders.map((order) => order.toEntity()).toList());
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.code} - ${e.message}');
      return Left(e.message ?? '');
    }
  }
}
