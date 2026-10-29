import 'package:flutter_bloc/flutter_bloc.dart';

class MainShellCubit extends Cubit<int> {
  MainShellCubit() : super(0);

  void changeTab(int index) {
    if (index != state) emit(index);
  }
}
