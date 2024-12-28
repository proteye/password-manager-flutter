import 'package:flutter/widgets.dart';

/// Password manager text styles.
abstract class PmTextStyle {
  const PmTextStyle._();

  /// DisplayLarge48R
  ///
  /// fontFamily: Roboto
  /// fontSize: 48px
  /// height: 64px
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle displayLarge48R = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 48,
    height: 1.33,
    fontWeight: FontWeight.w400,
  );

  /// DisplayLarge48RItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 48px
  /// height: 64px
  /// fontWeight: undefined
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle displayLarge48RItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 48,
    height: 1.33,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  /// DisplayLarge48RUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 48px
  /// height: 64px
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle displayLarge48RUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 48,
    height: 1.33,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );

  /// DisplayLarge48M
  ///
  /// fontFamily: Roboto
  /// fontSize: 48px
  /// height: 64px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle displayLarge48M = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 48,
    height: 1.33,
    fontWeight: FontWeight.w500,
  );

  /// DisplayLarge48MItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 48px
  /// height: 64px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle displayLarge48MItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 48,
    height: 1.33,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
  );

  /// DisplayLarge48MUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 48px
  /// height: 64px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle displayLarge48MUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 48,
    height: 1.33,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
  );

  /// DisplayLarge48S
  ///
  /// fontFamily: Roboto
  /// fontSize: 48px
  /// height: 64px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle displayLarge48S = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 48,
    height: 1.33,
    fontWeight: FontWeight.w700,
  );

  /// DisplayLarge48SItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 48px
  /// height: 64px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle displayLarge48SItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 48,
    height: 1.33,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
  );

  /// DisplayLarge48SUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 48px
  /// height: 64px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle displayLarge48SUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 48,
    height: 1.33,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  );

  /// DisplayLarge48B
  ///
  /// fontFamily: Roboto
  /// fontSize: 48px
  /// height: 64px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle displayLarge48B = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 48,
    height: 1.33,
    fontWeight: FontWeight.w900,
  );

  /// DisplayLarge48BItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 48px
  /// height: 64px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle displayLarge48BItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 48,
    height: 1.33,
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
  );

  /// DisplayLarge48BUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 48px
  /// height: 64px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle displayLarge48BUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 48,
    height: 1.33,
    fontWeight: FontWeight.w900,
    decoration: TextDecoration.underline,
  );

  /// DisplayMedium32R
  ///
  /// fontFamily: Roboto
  /// fontSize: 32px
  /// height: 40px
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle displayMedium32R = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 32,
    height: 1.25,
    fontWeight: FontWeight.w400,
  );

  /// DisplayMedium32RItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 32px
  /// height: 40px
  /// fontWeight: undefined
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle displayMedium32RItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 32,
    height: 1.25,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  /// DisplayMedium32RUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 32px
  /// height: 40px
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle displayMedium32RUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 32,
    height: 1.25,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );

  /// DisplayMedium32M
  ///
  /// fontFamily: Roboto
  /// fontSize: 32px
  /// height: 40px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle displayMedium32M = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 32,
    height: 1.25,
    fontWeight: FontWeight.w500,
  );

  /// DisplayMedium32MItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 32px
  /// height: 40px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle displayMedium32MItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 32,
    height: 1.25,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
  );

  /// DisplayMedium32MUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 32px
  /// height: 40px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle displayMedium32MUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 32,
    height: 1.25,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
  );

  /// DisplayMedium32S
  ///
  /// fontFamily: Roboto
  /// fontSize: 32px
  /// height: 40px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle displayMedium32S = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 32,
    height: 1.25,
    fontWeight: FontWeight.w700,
  );

  /// DisplayMedium32SItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 32px
  /// height: 40px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle displayMedium32SItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 32,
    height: 1.25,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
  );

  /// DisplayMedium32SUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 32px
  /// height: 40px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle displayMedium32SUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 32,
    height: 1.25,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  );

  /// DisplayMedium32B
  ///
  /// fontFamily: Roboto
  /// fontSize: 32px
  /// height: 40px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle displayMedium32B = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 32,
    height: 1.25,
    fontWeight: FontWeight.w900,
  );

  /// DisplayMedium32BItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 32px
  /// height: 40px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle displayMedium32BItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 32,
    height: 1.25,
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
  );

  /// DisplayMedium32BUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 32px
  /// height: 40px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle displayMedium32BUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 32,
    height: 1.25,
    fontWeight: FontWeight.w900,
    decoration: TextDecoration.underline,
  );

  /// DisplaySmall24R
  ///
  /// fontFamily: Roboto
  /// fontSize: 24px
  /// height: 28px
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle displaySmall24R = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24,
    height: 1.17,
    fontWeight: FontWeight.w400,
  );

  /// DisplaySmall24RItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 24px
  /// height: 28px
  /// fontWeight: undefined
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle displaySmall24RItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24,
    height: 1.17,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  /// DisplaySmall24RUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 24px
  /// height: 28px
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle displaySmall24RUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24,
    height: 1.17,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );

  /// DisplaySmall24M
  ///
  /// fontFamily: Roboto
  /// fontSize: 24px
  /// height: 28px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle displaySmall24M = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24,
    height: 1.17,
    fontWeight: FontWeight.w500,
  );

  /// DisplaySmall24MItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 24px
  /// height: 28px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle displaySmall24MItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24,
    height: 1.17,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
  );

  /// DisplaySmall24MUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 24px
  /// height: 28px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle displaySmall24MUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24,
    height: 1.17,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
  );

  /// DisplaySmall24S
  ///
  /// fontFamily: Roboto
  /// fontSize: 24px
  /// height: 28px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle displaySmall24S = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24,
    height: 1.17,
    fontWeight: FontWeight.w700,
  );

  /// DisplaySmall24SItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 24px
  /// height: 28px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle displaySmall24SItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24,
    height: 1.17,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
  );

  /// DisplaySmall24SUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 24px
  /// height: 28px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle displaySmall24SUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24,
    height: 1.17,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  );

  /// DisplaySmall24B
  ///
  /// fontFamily: Roboto
  /// fontSize: 24px
  /// height: 28px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle displaySmall24B = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24,
    height: 1.17,
    fontWeight: FontWeight.w900,
  );

  /// DisplaySmall24BItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 24px
  /// height: 28px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle displaySmall24BItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24,
    height: 1.17,
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
  );

  /// DisplaySmall24BUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 24px
  /// height: 28px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle displaySmall24BUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24,
    height: 1.17,
    fontWeight: FontWeight.w900,
    decoration: TextDecoration.underline,
  );

  /// TitleLarge18R
  ///
  /// fontFamily: Roboto
  /// fontSize: 18px
  /// height: 24px
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle titleLarge18R = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    height: 1.33,
    fontWeight: FontWeight.w400,
  );

  /// TitleLarge18RItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 18px
  /// height: 24px
  /// fontWeight: undefined
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle titleLarge18RItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    height: 1.33,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  /// TitleLarge18RUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 18px
  /// height: 24px
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle titleLarge18RUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    height: 1.33,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );

  /// TitleLarge18M
  ///
  /// fontFamily: Roboto
  /// fontSize: 18px
  /// height: 24px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle titleLarge18M = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    height: 1.33,
    fontWeight: FontWeight.w500,
  );

  /// TitleLarge18MItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 18px
  /// height: 24px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle titleLarge18MItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    height: 1.33,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
  );

  /// TitleLarge18MUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 18px
  /// height: 24px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle titleLarge18MUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    height: 1.33,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
  );

  /// TitleLarge18S
  ///
  /// fontFamily: Roboto
  /// fontSize: 18px
  /// height: 24px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle titleLarge18S = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    height: 1.33,
    fontWeight: FontWeight.w700,
  );

  /// TitleLarge18SItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 18px
  /// height: 24px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle titleLarge18SItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    height: 1.33,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
  );

  /// TitleLarge18SUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 18px
  /// height: 24px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle titleLarge18SUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    height: 1.33,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  );

  /// TitleLarge18B
  ///
  /// fontFamily: Roboto
  /// fontSize: 18px
  /// height: 24px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle titleLarge18B = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    height: 1.33,
    fontWeight: FontWeight.w900,
  );

  /// TitleLarge18BItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 18px
  /// height: 24px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle titleLarge18BItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    height: 1.33,
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
  );

  /// TitleLarge18BUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 18px
  /// height: 24px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle titleLarge18BUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    height: 1.33,
    fontWeight: FontWeight.w900,
    decoration: TextDecoration.underline,
  );

  /// TitleMedium16R
  ///
  /// fontFamily: Roboto
  /// fontSize: 16px
  /// height: 20px
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle titleMedium16R = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    height: 1.25,
    fontWeight: FontWeight.w400,
  );

  /// TitleMedium16RItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 16px
  /// height: 20px
  /// fontWeight: undefined
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle titleMedium16RItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    height: 1.25,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  /// TitleMedium16RUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 16px
  /// height: 20px
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle titleMedium16RUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    height: 1.25,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );

  /// TitleMedium16M
  ///
  /// fontFamily: Roboto
  /// fontSize: 16px
  /// height: 20px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle titleMedium16M = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    height: 1.25,
    fontWeight: FontWeight.w500,
  );

  /// TitleMedium16MItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 16px
  /// height: 20px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle titleMedium16MItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    height: 1.25,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
  );

  /// TitleMedium16MUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 16px
  /// height: 20px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle titleMedium16MUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    height: 1.25,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
  );

  /// TitleMedium16S
  ///
  /// fontFamily: Roboto
  /// fontSize: 16px
  /// height: 20px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle titleMedium16S = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    height: 1.25,
    fontWeight: FontWeight.w700,
  );

  /// TitleMedium16SItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 16px
  /// height: 20px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle titleMedium16SItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    height: 1.25,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
  );

  /// TitleMedium16SUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 16px
  /// height: 20px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle titleMedium16SUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    height: 1.25,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  );

  /// TitleMedium16B
  ///
  /// fontFamily: Roboto
  /// fontSize: 16px
  /// height: 20px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle titleMedium16B = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    height: 1.25,
    fontWeight: FontWeight.w900,
  );

  /// TitleMedium16BItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 16px
  /// height: 20px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle titleMedium16BItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    height: 1.25,
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
  );

  /// TitleMedium16BUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 16px
  /// height: 20px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle titleMedium16BUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    height: 1.25,
    fontWeight: FontWeight.w900,
    decoration: TextDecoration.underline,
  );

  /// TitleSmall14R
  ///
  /// fontFamily: Roboto
  /// fontSize: 14px
  /// height: 16px
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle titleSmall14R = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    height: 1.14,
    fontWeight: FontWeight.w400,
  );

  /// TitleSmall14RItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 14px
  /// height: 16px
  /// fontWeight: undefined
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle titleSmall14RItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    height: 1.14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  /// TitleSmall14RUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 14px
  /// height: 16px
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle titleSmall14RUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    height: 1.14,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );

  /// TitleSmall14M
  ///
  /// fontFamily: Roboto
  /// fontSize: 14px
  /// height: 16px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle titleSmall14M = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    height: 1.14,
    fontWeight: FontWeight.w500,
  );

  /// TitleSmall14MItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 14px
  /// height: 16px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle titleSmall14MItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    height: 1.14,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
  );

  /// TitleSmall14MUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 14px
  /// height: 16px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle titleSmall14MUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    height: 1.14,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
  );

  /// TitleSmall14S
  ///
  /// fontFamily: Roboto
  /// fontSize: 14px
  /// height: 16px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle titleSmall14S = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    height: 1.14,
    fontWeight: FontWeight.w700,
  );

  /// TitleSmall14SItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 14px
  /// height: 16px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle titleSmall14SItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    height: 1.14,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
  );

  /// TitleSmall14SUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 14px
  /// height: 16px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle titleSmall14SUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    height: 1.14,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  );

  /// TitleSmall14B
  ///
  /// fontFamily: Roboto
  /// fontSize: 14px
  /// height: 16px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle titleSmall14B = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    height: 1.14,
    fontWeight: FontWeight.w900,
  );

  /// TitleSmall14BItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 14px
  /// height: 16px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle titleSmall14BItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    height: 1.14,
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
  );

  /// TitleSmall14BUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 14px
  /// height: 16px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle titleSmall14BUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    height: 1.14,
    fontWeight: FontWeight.w900,
    decoration: TextDecoration.underline,
  );

  /// BodyMedium14R
  ///
  /// fontFamily: Roboto
  /// fontSize: 14px
  /// height: 20px
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle bodyMedium14R = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    height: 1.43,
    fontWeight: FontWeight.w400,
  );

  /// BodyMedium14RItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 14px
  /// height: 20px
  /// fontWeight: undefined
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle bodyMedium14RItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    height: 1.43,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  /// BodyMedium14RUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 14px
  /// height: 20px
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle bodyMedium14RUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    height: 1.43,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );

  /// BodyMedium14M
  ///
  /// fontFamily: Roboto
  /// fontSize: 14px
  /// height: 20px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle bodyMedium14M = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    height: 1.43,
    fontWeight: FontWeight.w500,
  );

  /// BodyMedium14MItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 14px
  /// height: 20px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle bodyMedium14MItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    height: 1.43,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
  );

  /// BodyMedium14MUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 14px
  /// height: 20px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle bodyMedium14MUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    height: 1.43,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
  );

  /// BodyMedium14S
  ///
  /// fontFamily: Roboto
  /// fontSize: 14px
  /// height: 20px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle bodyMedium14S = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    height: 1.43,
    fontWeight: FontWeight.w700,
  );

  /// BodyMedium14SItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 14px
  /// height: 20px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle bodyMedium14SItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    height: 1.43,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
  );

  /// BodyMedium14SUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 14px
  /// height: 20px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle bodyMedium14SUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    height: 1.43,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  );

  /// BodyMedium14B
  ///
  /// fontFamily: Roboto
  /// fontSize: 14px
  /// height: 20px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle bodyMedium14B = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    height: 1.43,
    fontWeight: FontWeight.w900,
  );

  /// BodyMedium14BItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 14px
  /// height: 20px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle bodyMedium14BItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    height: 1.43,
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
  );

  /// BodyMedium14BUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 14px
  /// height: 20px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle bodyMedium14BUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    height: 1.43,
    fontWeight: FontWeight.w900,
    decoration: TextDecoration.underline,
  );

  /// LabelMedium12R
  ///
  /// fontFamily: Roboto
  /// fontSize: 12px
  /// height: 16px
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle labelMedium12R = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    height: 1.33,
    fontWeight: FontWeight.w400,
  );

  /// LabelMedium12RItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 12px
  /// height: 16px
  /// fontWeight: undefined
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle labelMedium12RItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    height: 1.33,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  /// LabelMedium12RUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 12px
  /// height: 16px
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle labelMedium12RUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    height: 1.33,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );

  /// LabelMedium12M
  ///
  /// fontFamily: Roboto
  /// fontSize: 12px
  /// height: 16px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle labelMedium12M = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    height: 1.33,
    fontWeight: FontWeight.w500,
  );

  /// LabelMedium12MItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 12px
  /// height: 16px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle labelMedium12MItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    height: 1.33,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
  );

  /// LabelMedium12MUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 12px
  /// height: 16px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle labelMedium12MUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    height: 1.33,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
  );

  /// LabelMedium12S
  ///
  /// fontFamily: Roboto
  /// fontSize: 12px
  /// height: 16px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle labelMedium12S = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    height: 1.33,
    fontWeight: FontWeight.w700,
  );

  /// LabelMedium12SItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 12px
  /// height: 16px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle labelMedium12SItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    height: 1.33,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
  );

  /// LabelMedium12SUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 12px
  /// height: 16px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle labelMedium12SUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    height: 1.33,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  );

  /// LabelMedium12B
  ///
  /// fontFamily: Roboto
  /// fontSize: 12px
  /// height: 16px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle labelMedium12B = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    height: 1.33,
    fontWeight: FontWeight.w900,
  );

  /// LabelMedium12BItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 12px
  /// height: 16px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle labelMedium12BItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    height: 1.33,
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
  );

  /// LabelMedium12BUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 12px
  /// height: 16px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle labelMedium12BUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    height: 1.33,
    fontWeight: FontWeight.w900,
    decoration: TextDecoration.underline,
  );

  /// LabelSmall10R
  ///
  /// fontFamily: Roboto
  /// fontSize: 10px
  /// height: 12px
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle labelSmall10R = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 10,
    height: 1.2,
    fontWeight: FontWeight.w400,
  );

  /// LabelSmall10RItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 10px
  /// height: 12px
  /// fontWeight: undefined
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle labelSmall10RItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 10,
    height: 1.2,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  /// LabelSmall10RUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 10px
  /// height: 12px
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle labelSmall10RUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 10,
    height: 1.2,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );

  /// LabelSmall10M
  ///
  /// fontFamily: Roboto
  /// fontSize: 10px
  /// height: 12px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle labelSmall10M = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 10,
    height: 1.2,
    fontWeight: FontWeight.w500,
  );

  /// LabelSmall10MItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 10px
  /// height: 12px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle labelSmall10MItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 10,
    height: 1.2,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
  );

  /// LabelSmall10MUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 10px
  /// height: 12px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle labelSmall10MUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 10,
    height: 1.2,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
  );

  /// LabelSmall10S
  ///
  /// fontFamily: Roboto
  /// fontSize: 10px
  /// height: 12px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle labelSmall10S = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 10,
    height: 1.2,
    fontWeight: FontWeight.w700,
  );

  /// LabelSmall10SItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 10px
  /// height: 12px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle labelSmall10SItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 10,
    height: 1.2,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
  );

  /// LabelSmall10SUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 10px
  /// height: 12px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle labelSmall10SUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 10,
    height: 1.2,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  );

  /// LabelSmall10B
  ///
  /// fontFamily: Roboto
  /// fontSize: 10px
  /// height: 12px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle labelSmall10B = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 10,
    height: 1.2,
    fontWeight: FontWeight.w900,
  );

  /// LabelSmall10BItalic
  ///
  /// fontFamily: Roboto
  /// fontSize: 10px
  /// height: 12px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: italic
  /// decoration: none
  static const TextStyle labelSmall10BItalic = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 10,
    height: 1.2,
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
  );

  /// LabelSmall10BUnderlined
  ///
  /// fontFamily: Roboto
  /// fontSize: 10px
  /// height: 12px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: underline
  static const TextStyle labelSmall10BUnderlined = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 10,
    height: 1.2,
    fontWeight: FontWeight.w900,
    decoration: TextDecoration.underline,
  );
}
