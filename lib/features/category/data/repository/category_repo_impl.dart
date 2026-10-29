import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../data/entities/category_entity.dart';
import '../../domain/repository/category_repo.dart';
import '../datasource/category_remote_datasource.dart';

class CategoryRepoImpl implements CategoryRepo {
  final CategoryRemoteDataSource categoryRemoteDataSource;

  CategoryRepoImpl(this.categoryRemoteDataSource);

  @override
  Future<Either<String, List<CategoryEntity>>> getCategories() async {
    try {
      final categories = await categoryRemoteDataSource.getCategories();
      return Right(categories.map((category) => category.toEntity()).toList());
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.code} - ${e.message}');
      return Left(e.message ?? '');
    }
  }
}
