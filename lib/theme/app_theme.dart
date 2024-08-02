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
      primary: ColorApp.whitePrimary,
      onPrimary: ColorApp.textPrimary, // Text on primary color
      secondary: ColorApp.textSecondary,
      onSecondary: ColorApp.blueGrey, // Text on secondary color
      surface: ColorApp.greenPrimary,
      onSurface: ColorApp.textPrimary, // Text on surface color
      tertiary: ColorApp.textPrimary,
      secondaryContainer: ColorApp.greyPrymery,
      onSecondaryContainer: ColorApp.greenDark,
      primaryContainer: ColorApp.greenLight,
      error: ColorApp.redPrimary,
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
      primary: ColorApp.blackPrimary,
      onPrimary: ColorApp.whitePrimary, // Text on primary color
      secondary: ColorApp.whitePrimary,
      onSecondary: ColorApp.blueGrey, // Text on secondary color
      surface: ColorApp.greenPrimary,
      onSurface: ColorApp.textPrimary, // Text on surface color
      tertiary: ColorApp.textPrimary,
      secondaryContainer: ColorApp.greyPrymery,
      onSecondaryContainer: ColorApp.greenDark,
      primaryContainer: ColorApp.greenLight,
      error: ColorApp.redPrimary,
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
}
