import 'package:flutter/material.dart';
import 'dark_colors.dart';

class DarkTheme {
  static final theme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: DarkColors.grey,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: DarkColors.white,
        fontSize: 20,
      ),
      iconTheme: IconThemeData(color: Colors.black87),
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
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: DarkColors.orange,
        foregroundColor: DarkColors.orange,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    ),
    backgroundColor: DarkColors.grey,
  );
}
