import '../../domain/entities/legal_content_entity.dart';

abstract class LegalState {}

class LegalInitState extends LegalState {}

class LegalLoadingState extends LegalState {}

class LegalErrorState extends LegalState {
  final String errorMessage;

  LegalErrorState({required this.errorMessage});
}

class LegalSuccessState extends LegalState {
  final LegalContentEntity content;

  LegalSuccessState({required this.content});
}
