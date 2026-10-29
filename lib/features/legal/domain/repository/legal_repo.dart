import 'package:dartz/dartz.dart';

import '../entities/legal_content_entity.dart';

abstract class LegalRepo {
  Future<Either<String, LegalContentEntity>> getContent({required String docId});
}
