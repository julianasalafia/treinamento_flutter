import 'package:flutter/material.dart';
import 'package:to_do_list/app/themes/color_extension.dart';
import 'package:to_do_list/app/themes/light/light_colors.dart';

class LightTheme {
  static final theme = ThemeData(
    dividerColor: LightColors.gray,
    textTheme: const TextTheme(
      titleSmall: TextStyle(color: LightColors.gray),
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
        focusedBadgeColor: LightColors.darkBlue,
        unfocusedBadgeColor: LightColors.lightGray,
      ),
    ],
  );
}
