import 'package:flutter/material.dart';
import 'dark_colors.dart';

class DarkTheme {
  static final theme = ThemeData(
    scaffoldBackgroundColor: DarkColors.grey,
    appBarTheme: const AppBarTheme(
      color: DarkColors.grey,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: DarkColors.white,
        fontSize: 20,
        fontFamily: 'Barracuda',
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    dividerColor: DarkColors.gray,
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        color: DarkColors.white,
        fontFamily: 'Barracuda',
        fontSize: 18,
      ),
      bodySmall: TextStyle(
        color: DarkColors.white,
        fontFamily: 'Barracuda',
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        color: DarkColors.white,
        fontFamily: 'Barracuda',
        fontSize: 22,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          color: DarkColors.white,
          fontFamily: 'Barracuda',
          fontSize: 18,
        ),
        backgroundColor: DarkColors.orange,
        minimumSize: const Size(double.infinity, 48),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          color: DarkColors.white,
          fontFamily: 'Barracuda',
          fontSize: 18,
        ),
        side: const BorderSide(width: 2.0, color: DarkColors.orange),
        minimumSize: const Size(double.infinity, 48),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
    ),
  );
}
