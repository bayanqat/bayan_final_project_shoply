import 'package:final_project_shoply/features/about/presentation/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasource/about_remote_datasource.dart';
import '../../data/repository/about_repo_impl.dart';
import '../../domain/usecase/about_usecase.dart';

class AboutCubit extends Cubit<AboutState> {
  AboutCubit() : super(AboutInitState());

  final _aboutUseCase = AboutUseCase(AboutRepoImpl(AboutRemoteDataSource()));

  Future<void> getAbout() async {
    emit(AboutLoadingState());
    final result = await _aboutUseCase();
    result.fold(
      (errorMessage) {
        emit(AboutErrorState(errorMessage: errorMessage));
      },
      (about) {
        emit(AboutSuccessState(about: about));
      },
    );
  }
}
