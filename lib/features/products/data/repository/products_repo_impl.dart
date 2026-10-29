import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../data/entities/product_entity.dart';
import '../../domain/repository/products_repo.dart';
import '../datasource/products_remote_datasource.dart';

class ProductsRepoImpl implements ProductsRepo {
  final ProductsRemoteDataSource productsRemoteDataSource;

  ProductsRepoImpl(this.productsRemoteDataSource);

  @override
  Future<Either<String, List<ProductEntity>>> getProducts({String? categoryId, int? limit}) async {
    try {
      final products = await productsRemoteDataSource.getProducts(
        categoryId: categoryId,
        limit: limit,
      );
      return Right(products.map((product) => product.toEntity()).toList());
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.code} - ${e.message}');
      return Left(e.message ?? '');
    }
  }
}
