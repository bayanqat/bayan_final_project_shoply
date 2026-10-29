import 'package:dartz/dartz.dart';

import '../entities/legal_content_entity.dart';
import '../repository/legal_repo.dart';

class LegalUseCase {
  final LegalRepo legalRepo;

  LegalUseCase(this.legalRepo);

  Future<Either<String, LegalContentEntity>> call({required String docId}) {
    return legalRepo.getContent(docId: docId);
  }
}
