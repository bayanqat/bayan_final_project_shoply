import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/about_entity.dart';
import '../../domain/repository/about_repo.dart';
import '../datasource/about_remote_datasource.dart';

class AboutRepoImpl implements AboutRepo {
  final AboutRemoteDataSource aboutRemoteDataSource;

  AboutRepoImpl(this.aboutRemoteDataSource);

  @override
  Future<Either<String, AboutEntity>> getAbout() async {
    try {
      final about = await aboutRemoteDataSource.getAbout();
      return Right(about.toEntity());
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.code} - ${e.message}');
      return Left(e.message ?? '');
    }
  }
}
