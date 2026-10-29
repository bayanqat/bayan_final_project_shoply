import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Colors that change between light and dark mode. Read them with context.colors
class AppPalette extends ThemeExtension<AppPalette> {
  const AppPalette({
    required this.background,
    required this.surface,
    required this.primary,
    required this.onPrimary,
    required this.primarySoft,
    required this.textPrimary,
    required this.textSecondary,
    required this.icon,
    required this.border,
    required this.error,
    required this.onError,
    required this.warning,
    required this.warningBackground,
  });

  /// Screen background
  final Color background;

  /// Cards, text fields and tiles
  final Color surface;
  final Color primary;
  final Color onPrimary;

  /// Soft circle behind header icons, chips and counter buttons
  final Color primarySoft;
  final Color textPrimary;
  final Color textSecondary;
  final Color icon;
  final Color border;
  final Color error;
  final Color onError;
  final Color warning;
  final Color warningBackground;

  static final light = AppPalette(
    background: AppColors.backgrround,
    surface: AppColors.primaryColor.withValues(alpha: 0.05),
    primary: AppColors.primaryColor,
    onPrimary: AppColors.onPrimary,
    primarySoft: AppColors.secondary,
    textPrimary: Colors.black,
    textSecondary: Colors.grey.shade600,
    icon: Colors.grey.shade800,
    border: Colors.grey.shade200,
    error: AppColors.error,
    onError: AppColors.onError,
    warning: AppColors.warning,
    warningBackground: AppColors.warningBackground,
  );

  static const dark = AppPalette(
    background: Color(0xFF121212),
    surface: Color(0xFF1E1E1E),
    primary: Color(0xFF2FD39B),
    onPrimary: Color(0xFF0B1F17),
    primarySoft: Color(0xFF1C3A2F),
    textPrimary: Color(0xFFF5F5F5),
    textSecondary: Color(0xFFA6A6A6),
    icon: Color(0xFFD0D0D0),
    border: Color(0xFF2C2C2C),
    error: Color(0xFFFF6B6B),
    onError: Color(0xFFFFFFFF),
    warning: Color(0xFFF2C94C),
    warningBackground: Color(0xFF3A3012),
  );

  @override
  AppPalette copyWith({
    Color? background,
    Color? surface,
    Color? primary,
    Color? onPrimary,
    Color? primarySoft,
    Color? textPrimary,
    Color? textSecondary,
    Color? icon,
    Color? border,
    Color? error,
    Color? onError,
    Color? warning,
    Color? warningBackground,
  }) {
    return AppPalette(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primarySoft: primarySoft ?? this.primarySoft,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      icon: icon ?? this.icon,
      border: border ?? this.border,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      warning: warning ?? this.warning,
      warningBackground: warningBackground ?? this.warningBackground,
    );
  }

  @override
  AppPalette lerp(AppPalette? other, double t) {
    if (other == null) return this;
    return AppPalette(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      primarySoft: Color.lerp(primarySoft, other.primarySoft, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      icon: Color.lerp(icon, other.icon, t)!,
      border: Color.lerp(border, other.border, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningBackground: Color.lerp(warningBackground, other.warningBackground, t)!,
    );
  }
}

extension AppPaletteContext on BuildContext {
  AppPalette get colors => Theme.of(this).extension<AppPalette>()!;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
