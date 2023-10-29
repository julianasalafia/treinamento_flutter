import 'package:flutter/material.dart';

class ColorExtension extends ThemeExtension<ColorExtension> {
  final Color focusedBadgeColor;
  final Color unfocusedBadgeColor;

  ColorExtension(
      {required this.focusedBadgeColor, required this.unfocusedBadgeColor});

  @override
  ThemeExtension<ColorExtension> copyWith({
    Color? focusedBadgeColor,
    Color? unfocusedBadgeColor,
  }) {
    return ColorExtension(
      focusedBadgeColor: focusedBadgeColor ?? this.focusedBadgeColor,
      unfocusedBadgeColor: unfocusedBadgeColor ?? this.unfocusedBadgeColor,
    );
  }

  @override
  ThemeExtension<ColorExtension> lerp(
    covariant ThemeExtension<ColorExtension>? other,
    double t,
  ) {
    if (other == null || t < 0.5) return this;
    return other;
  }
}
