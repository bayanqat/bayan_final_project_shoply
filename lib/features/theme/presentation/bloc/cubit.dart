import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/local/local_storage.dart';

/// App-wide light/dark mode. Follows the phone until the user picks one in Settings
class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(_savedThemeMode());

  static ThemeMode _savedThemeMode() {
    switch (LocalStorage.instance.getThemeMode()) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> setDarkMode(bool isDark) async {
    final themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    await LocalStorage.instance.setThemeMode(themeMode: themeMode.name);
    emit(themeMode);
  }
}
