import 'package:dartz/dartz.dart';

import '../entities/contact_info_entity.dart';
import '../repository/contact_us_repo.dart';

class ContactUsUseCase {
  final ContactUsRepo contactUsRepo;

  ContactUsUseCase(this.contactUsRepo);

  Future<Either<String, ContactInfoEntity>> getContactInfo() {
    return contactUsRepo.getContactInfo();
  }

  Future<Either<String, String>> sendMessage({
    required String fullName,
    required String email,
    required String subject,
    required String message,
  }) {
    return contactUsRepo.sendMessage(
      fullName: fullName,
      email: email,
      subject: subject,
      message: message,
    );
  }
}
