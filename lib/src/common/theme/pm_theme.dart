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
    textTheme: textTheme,
  );

  /// Dark theme.
  static ThemeData dark = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: PmColors.generalBlue4,
    ),
    textTheme: textTheme,
  );

  /// Text theme.
  static final textTheme = const TextTheme(
    displayLarge: PmTextStyle.displayLarge48M,
    displayMedium: PmTextStyle.displayMedium32M,
    displaySmall: PmTextStyle.displaySmall24M,
    titleLarge: PmTextStyle.titleLarge18M,
    titleMedium: PmTextStyle.titleMedium16M,
    titleSmall: PmTextStyle.titleSmall14M,
    bodyLarge: PmTextStyle.bodyMedium14R,
    bodyMedium: PmTextStyle.bodyMedium14R,
    bodySmall: PmTextStyle.bodyMedium14R,
    labelLarge: PmTextStyle.labelMedium12R,
    labelMedium: PmTextStyle.labelMedium12R,
    labelSmall: PmTextStyle.labelSmall10R,
  ).apply(
    fontFamily: 'Roboto',
  );
}
