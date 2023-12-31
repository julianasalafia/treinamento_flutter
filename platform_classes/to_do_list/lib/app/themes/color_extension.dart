import 'package:flutter/material.dart';

class ColorExtension extends ThemeExtension<ColorExtension> {
  final Color focusedBadgeColor;
  final Color unfocusedBadgeColor;
  final Color doneBackgroundColor;
  final Color doneBorderColor;
  final Color shimmerBaseColor;
  final Color shimmerHighlightColor;

  ColorExtension({
    required this.focusedBadgeColor,
    required this.unfocusedBadgeColor,
    required this.doneBackgroundColor,
    required this.doneBorderColor,
    required this.shimmerBaseColor,
    required this.shimmerHighlightColor,
  });

  @override
  ThemeExtension<ColorExtension> copyWith({
    Color? focusedBadgeColor,
    Color? unfocusedBadgeColor,
    Color? doneBackgroundColor,
    Color? doneBorderColor,
    Color? shimmerBaseColor,
    Color? shimmerHighlightColor,
  }) {
    return ColorExtension(
      doneBackgroundColor: doneBackgroundColor ?? this.doneBackgroundColor,
      focusedBadgeColor: focusedBadgeColor ?? this.focusedBadgeColor,
      unfocusedBadgeColor: unfocusedBadgeColor ?? this.unfocusedBadgeColor,
      doneBorderColor: doneBorderColor ?? this.doneBorderColor,
      shimmerBaseColor: shimmerBaseColor ?? this.shimmerBaseColor,
      shimmerHighlightColor:
          shimmerHighlightColor ?? this.shimmerHighlightColor,
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
