import 'package:dartz/dartz.dart';

import '../entities/contact_info_entity.dart';

abstract class ContactUsRepo {
  Future<Either<String, ContactInfoEntity>> getContactInfo();

  Future<Either<String, String>> sendMessage({
    required String fullName,
    required String email,
    required String subject,
    required String message,
  });
}
