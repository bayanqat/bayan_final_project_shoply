import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../data/entities/cart_item_entity.dart';
import '../../../../data/models/cart/cart_item_model.dart';
import '../../domain/repository/cart_repo.dart';
import '../datasource/cart_remote_datasource.dart';

class CartRepoImpl implements CartRepo {
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepoImpl(this.cartRemoteDataSource);

  @override
  Future<Either<String, List<CartItemEntity>>> getCart() async {
    try {
      final items = await cartRemoteDataSource.getCart();
      return Right(items.map((item) => item.toEntity()).toList());
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.code} - ${e.message}');
      return Left(e.message ?? '');
    }
  }

  @override
  Future<Either<String, bool>> addToCart({required String productId, required int quantity}) async {
    try {
      await cartRemoteDataSource.addToCart(productId: productId, quantity: quantity);
      return Right(true);
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.code} - ${e.message}');
      return Left(e.message ?? '');
    }
  }

  @override
  Future<Either<String, bool>> updateQuantity({
    required String productId,
    required int quantity,
  }) async {
    try {
      await cartRemoteDataSource.updateQuantity(productId: productId, quantity: quantity);
      return Right(true);
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.code} - ${e.message}');
      return Left(e.message ?? '');
    }
  }

  @override
  Future<Either<String, bool>> removeFromCart({required String productId}) async {
    try {
      await cartRemoteDataSource.removeFromCart(productId: productId);
      return Right(true);
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.code} - ${e.message}');
      return Left(e.message ?? '');
    }
  }

  @override
  Future<Either<String, int>> checkout({required List<CartItemEntity> items}) async {
    try {
      final orderNumber = await cartRemoteDataSource.checkout(
        items: items.map(CartItemModel.fromEntity).toList(),
      );
      return Right(orderNumber);
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.code} - ${e.message}');
      return Left(e.message ?? '');
    }
  }
}
