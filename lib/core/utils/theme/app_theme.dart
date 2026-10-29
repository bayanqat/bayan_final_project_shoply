import 'package:flutter/material.dart';

import '../fonts/app_fonts.dart';
import 'app_palette.dart';

class AppTheme {
  static ThemeData themeLight = _buildTheme(Brightness.light, AppPalette.light);

  static ThemeData themeDark = _buildTheme(Brightness.dark, AppPalette.dark);

  static ThemeData _buildTheme(Brightness brightness, AppPalette palette) {
    return ThemeData(
      brightness: brightness,
      fontFamily: AppFonts.quikSand,
      scaffoldBackgroundColor: palette.background,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: palette.primary,
        onPrimary: palette.onPrimary,
        secondary: palette.primary,
        onSecondary: palette.onPrimary,
        error: palette.error,
        onError: palette.onError,
        surface: palette.background,
        onSurface: palette.textPrimary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: palette.background,
        surfaceTintColor: Colors.transparent,
        foregroundColor: palette.textPrimary,
      ),
      drawerTheme: DrawerThemeData(backgroundColor: palette.background),
      dividerColor: palette.border,
      extensions: [palette],
    );
  }
}
