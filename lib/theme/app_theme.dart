import 'package:flutter/material.dart';

import 'app_colors.dart';

@immutable
class AppTheme {
  const AppTheme._();
  static final lightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      // background: ColorLight.whitePrimary,
      // onBackground: ColorLight.blackPrimary, // Text on background color
      primary: ColorLight.whitePrimary,
      onPrimary: ColorLight.textPrimary, // Text on primary color
      secondary: ColorLight.textSecondary,
      onSecondary: ColorLight.blueGrey, // Text on secondary color
      surface: ColorLight.greenPrimary,
      onSurface: ColorLight.textPrimary, // Text on surface color
      tertiary: ColorLight.textPrimary,
      secondaryContainer: ColorLight.greyPrymery,
      onSecondaryContainer: ColorLight.greenDark,
      primaryContainer: ColorLight.greenLight,
      error: ColorLight.redPrimary,
    ),
    primaryColor: Colors.orange,
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.black,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      // foregroundColor: Colors.black,
      // backgroundColor: Colors.grey.shade300,
    ),
  );

  static final dartTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
      // background: ColorLight.whitePrimary,
      // onBackground: ColorLight.blackPrimary, // Text on background color
      primary: ColorLight.whitePrimary,
      onPrimary: ColorLight.textPrimary, // Text on primary color
      secondary: ColorLight.textSecondary,
      onSecondary: ColorLight.blueGrey, // Text on secondary color
      surface: ColorLight.greenPrimary,
      onSurface: ColorLight.textPrimary, // Text on surface color
      tertiary: ColorLight.textPrimary,
      secondaryContainer: ColorLight.greyPrymery,
      onSecondaryContainer: ColorLight.greenDark,
      primaryContainer: ColorLight.greenLight,
      error: ColorLight.redPrimary,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.white,
    ),
    primaryColor: Colors.orange,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      // foregroundColor: Colors.white,
      // backgroundColor: Colors.teal.shade500,
    ),
  );
  static final light = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      // background: ColorLight.whitePrimary,
      // onBackground: ColorLight.blackPrimary, // Text on background color
      primary: ColorLight.whitePrimary,
      onPrimary: ColorLight.textPrimary, // Text on primary color
      secondary: ColorLight.textSecondary,
      onSecondary: ColorLight.blueGrey, // Text on secondary color
      surface: ColorLight.greenPrimary,
      onSurface: ColorLight.textPrimary, // Text on surface color
      tertiary: ColorLight.textPrimary,
      secondaryContainer: ColorLight.greyPrymery,
      onSecondaryContainer: ColorLight.greenDark,
      primaryContainer: ColorLight.greenLight,
      error: ColorLight.redPrimary,
    ),
  );
}
