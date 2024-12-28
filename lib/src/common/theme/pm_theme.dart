import 'package:flutter/material.dart';
import 'package:password_manager/src/common/theme/theme.dart';

/// Password manager theme.
abstract final class PmTheme {
  /// Get theme by brightness.
  static ThemeData themeByBrightness(Brightness? brightness) =>
      brightness == Brightness.dark ? dark : light;

  /// Light theme.
  static ThemeData light = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: PmColors.generalBlue1,
    ),
  );

  /// Dark theme.
  static ThemeData dark = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: PmColors.generalBlue4,
    ),
  );
}
