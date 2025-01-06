import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  const AppTheme._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: lightPrimaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: lightSecondaryColor,
      elevation: 0,
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: lightSecondaryColor)),
    colorScheme: ColorScheme.light(secondary: lightSecondaryColor)
        .copyWith(background: lightSecondaryColor),
  );
}
