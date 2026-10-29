import '../../domain/entities/about_entity.dart';

abstract class AboutState {}

class AboutInitState extends AboutState {}

class AboutLoadingState extends AboutState {}

class AboutErrorState extends AboutState {
  final String errorMessage;

  AboutErrorState({required this.errorMessage});
}

class AboutSuccessState extends AboutState {
  final AboutEntity about;

  AboutSuccessState({required this.about});
}
