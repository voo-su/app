import 'package:flutter/material.dart';
import 'package:voo_su/core/theme/colors.dart';

class AppTheme {
  const AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.lightPrimary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      foregroundColor: AppColors.lightOnSurface40,
      elevation: 0,
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightPrimary,
      primaryContainer: AppColors.lightPrimaryContainer,
      onPrimaryContainer: AppColors.lightOnPrimaryContainer,
      background: AppColors.lightBackground,
      surface: AppColors.lightPrimarySurface,
      surfaceContainerHighest: AppColors.lightSecondarySurface,
      onSurface: AppColors.lightOnSurface20,
      onSurfaceVariant: AppColors.lightOnSurface40,
      inverseSurface: AppColors.lightOnSurface60,
      error: Colors.red,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkPrimary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      foregroundColor: AppColors.darkOnSurface40,
      elevation: 0,
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkPrimary,
      primaryContainer: AppColors.darkPrimaryContainer,
      onPrimaryContainer: AppColors.darkOnPrimaryContainer,
      background: AppColors.darkBackground,
      surface: AppColors.darkPrimarySurface,
      surfaceContainerHighest: AppColors.darkSecondarySurface,
      onSurface: AppColors.darkOnSurface20,
      onSurfaceVariant: AppColors.darkOnSurface40,
      inverseSurface: AppColors.darkOnSurface60,
      error: Colors.red,
    ),
  );
}
