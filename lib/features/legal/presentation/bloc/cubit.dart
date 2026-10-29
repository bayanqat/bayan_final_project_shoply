import 'package:final_project_shoply/features/legal/presentation/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasource/legal_remote_datasource.dart';
import '../../data/repository/legal_repo_impl.dart';
import '../../domain/usecase/legal_usecase.dart';

/// Loads Privacy Policy or Terms & Conditions, which share the same document shape
class LegalCubit extends Cubit<LegalState> {
  LegalCubit() : super(LegalInitState());

  final _legalUseCase = LegalUseCase(LegalRepoImpl(LegalRemoteDataSource()));

  Future<void> getContent({required String docId}) async {
    emit(LegalLoadingState());
    final result = await _legalUseCase(docId: docId);
    result.fold(
      (errorMessage) {
        emit(LegalErrorState(errorMessage: errorMessage));
      },
      (content) {
        emit(LegalSuccessState(content: content));
      },
    );
  }
}
