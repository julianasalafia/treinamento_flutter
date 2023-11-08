import 'package:flutter/material.dart';
import 'package:to_do_list/app/themes/color_extension.dart';
import 'package:to_do_list/app/themes/light/light_colors.dart';

class LightTheme {
  static final theme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black87,
        fontSize: 20,
      ),
      iconTheme: IconThemeData(color: Colors.black87),
    ),
    dividerColor: LightColors.gray,
    textTheme: const TextTheme(
      titleSmall: TextStyle(color: LightColors.gray),
      bodyMedium: TextStyle(color: LightColors.gray),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: LightColors.lightBlue,
        foregroundColor: LightColors.primaryBlue,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    ),
    extensions: [
      ColorExtension(
        doneBackgroundColor: LightColors.darkBlue,
        focusedBadgeColor: LightColors.darkBlue,
        unfocusedBadgeColor: LightColors.lightGray,
        doneBorderColor: LightColors.lightGray,
        shimmerBaseColor: Colors.grey.shade200,
        shimmerHighlightColor: Colors.grey.shade300,
      ),
    ],
  );
}
