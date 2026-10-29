import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../data/entities/product_entity.dart';
import '../../domain/repository/favorite_repo.dart';
import '../datasource/favorite_remote_datasource.dart';

class FavoriteRepoImpl implements FavoriteRepo {
  final FavoriteRemoteDataSource favoriteRemoteDataSource;

  FavoriteRepoImpl(this.favoriteRemoteDataSource);

  @override
  Future<Either<String, List<ProductEntity>>> getFavorites() async {
    try {
      final products = await favoriteRemoteDataSource.getFavorites();
      return Right(products.map((product) => product.toEntity()).toList());
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.code} - ${e.message}');
      return Left(e.message ?? '');
    }
  }

  @override
  Future<Either<String, bool>> addFavorite({required String productId}) async {
    try {
      await favoriteRemoteDataSource.addFavorite(productId: productId);
      return Right(true);
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.code} - ${e.message}');
      return Left(e.message ?? '');
    }
  }

  @override
  Future<Either<String, bool>> removeFavorite({required String productId}) async {
    try {
      await favoriteRemoteDataSource.removeFavorite(productId: productId);
      return Right(true);
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.code} - ${e.message}');
      return Left(e.message ?? '');
    }
  }
}
