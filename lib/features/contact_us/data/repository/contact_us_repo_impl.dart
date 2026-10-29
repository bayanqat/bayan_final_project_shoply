import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/contact_info_entity.dart';
import '../../domain/repository/contact_us_repo.dart';
import '../datasource/contact_us_remote_datasource.dart';

class ContactUsRepoImpl implements ContactUsRepo {
  final ContactUsRemoteDataSource contactUsRemoteDataSource;

  ContactUsRepoImpl(this.contactUsRemoteDataSource);

  @override
  Future<Either<String, ContactInfoEntity>> getContactInfo() async {
    try {
      final contactInfo = await contactUsRemoteDataSource.getContactInfo();
      return Right(contactInfo.toEntity());
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.code} - ${e.message}');
      return Left(e.message ?? '');
    }
  }

  @override
  Future<Either<String, String>> sendMessage({
    required String fullName,
    required String email,
    required String subject,
    required String message,
  }) async {
    try {
      await contactUsRemoteDataSource.sendMessage(
        fullName: fullName,
        email: email,
        subject: subject,
        message: message,
      );
      return Right('Thanks for reaching out. We will reply to $email soon.');
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.code} - ${e.message}');
      return Left(e.message ?? '');
    }
  }
}
