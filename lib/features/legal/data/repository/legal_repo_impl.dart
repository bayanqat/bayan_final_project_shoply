import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/legal_content_entity.dart';
import '../../domain/repository/legal_repo.dart';
import '../datasource/legal_remote_datasource.dart';

class LegalRepoImpl implements LegalRepo {
  final LegalRemoteDataSource legalRemoteDataSource;

  LegalRepoImpl(this.legalRemoteDataSource);

  @override
  Future<Either<String, LegalContentEntity>> getContent({required String docId}) async {
    try {
      final content = await legalRemoteDataSource.getContent(docId: docId);
      return Right(content.toEntity());
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.code} - ${e.message}');
      return Left(e.message ?? '');
    }
  }
}
