import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:password_manager/src/common/util/hex_color_extension.dart';
import 'package:password_manager/src/feature/settings/constant/settings_config.dart';

part 'app_settings.g.dart';

/// {@template app_settings}
/// Application settings.
/// {@endtemplate}
@JsonSerializable()
class AppSettings extends Equatable {
  /// {@macro app_settings}
  const AppSettings({
    this.general = const GeneralSettings(),
    this.advanced = const AdvancedSettings(),
    this.appearance = const AppearanceSettings(),
    this.textDisplay = const TextDisplaySettings(),
    this.citation = const CitationSettings(),
    this.version = SettingsConfig.version,
  });

  /// Get default Application settings
  factory AppSettings.defaultSettings({String? language}) {
    if (language == null) {
      return const AppSettings();
    }

    return AppSettings(
      general: GeneralSettings.withLanguage(language: language),
    );
  }

  /// Parse Application settings from JSON
  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);

  /// Unique name of settings
  static const String name = 'app';

  /// General settings
  final GeneralSettings general;

  /// Advanced settings
  final AdvancedSettings advanced;

  /// Appearance settings
  final AppearanceSettings appearance;

  /// Text display settings
  final TextDisplaySettings textDisplay;

  /// Citation copy settings
  final CitationSettings citation;

  /// App Settings version
  final int version;

  /// Convert Application settings to JSON
  Map<String, dynamic> toJson() => _$AppSettingsToJson(this);

  /// Get Application settings copy
  AppSettings getSettingsCopy() {
    return AppSettings(
      general: general.getSettingsCopy(),
      advanced: advanced.getSettingsCopy(),
      appearance: appearance.getSettingsCopy(),
      textDisplay: textDisplay.getSettingsCopy(),
      citation: citation.getSettingsCopy(),
      version: version,
    );
  }

  /// Application settings copy with...
  /// With updated actual [version] value.
  AppSettings copyWith({
    GeneralSettings? general,
    AdvancedSettings? advanced,
    AppearanceSettings? appearance,
    TextDisplaySettings? textDisplay,
    CitationSettings? citation,
  }) {
    return AppSettings(
      general: general ?? this.general,
      advanced: advanced ?? this.advanced,
      appearance: appearance ?? this.appearance,
      textDisplay: textDisplay ?? this.textDisplay,
      citation: citation ?? this.citation,
    );
  }

  /// Get General settings language
  ELanguage get language => general.language;

  /// Get Appearance settings theme mode
  ThemeMode get themeMode => appearance.themeMode;

  /// Get Brightness by theme mode
  Brightness get brightness => appearance.themeMode == ThemeMode.dark
      ? Brightness.dark
      : Brightness.light;

  /// Get Appearance settings accent color
  Color get accentColor => appearance.accentColor;

  @override
  String toString() {
    return 'AppSettings(version: $version)';
  }

  @override
  List<Object> get props =>
      [version, general, advanced, appearance, textDisplay, citation];
}

/// General settings
@JsonSerializable()
class GeneralSettings extends Equatable {
  /// General settings
  const GeneralSettings({
    this.startup = EStartupSessionConfig.lastSession,
    this.language = ELanguage.en,
  });

  /// Get default General settings with custom language.
  factory GeneralSettings.withLanguage({String? language}) => GeneralSettings(
        language: language != null
            ? ELanguage.values.firstWhere(
                (value) => value.name == language,
                orElse: () => ELanguage.en,
              )
            : ELanguage.en,
      );

  /// Parse General settings from JSON
  factory GeneralSettings.fromJson(Map<String, dynamic> json) =>
      _$GeneralSettingsFromJson(json);

  /// Startup session config
  final EStartupSessionConfig startup;

  /// App language
  final ELanguage language;

  /// Convert General settings to JSON
  Map<String, dynamic> toJson() => _$GeneralSettingsToJson(this);

  /// Get General settings copy
  GeneralSettings getSettingsCopy() {
    return GeneralSettings(startup: startup, language: language);
  }

  /// General settings copy with...
  GeneralSettings copyWith({
    EStartupSessionConfig? startup,
    ELanguage? language,
  }) {
    return GeneralSettings(
      startup: startup ?? this.startup,
      language: language ?? this.language,
    );
  }

  @override
  String toString() {
    return 'GeneralSettings($startup, $language)';
  }

  @override
  List<Object> get props => [startup, language];
}

/// Advanced settings
@JsonSerializable()
class AdvancedSettings extends Equatable {
  /// Advanced settings
  const AdvancedSettings({
    this.openOtVerseHyperlinkIn = 'RST+',
    this.openNtVerseHyperlinkIn = 'RST+',
    this.defaultStrongsDictionaryModule = 'СтрДв.dictionary',
    this.defaultGreekDictionaryModule,
    this.defaultHebrewDictionaryModule,
  });

  /// Parse Advanced settings from JSON
  factory AdvancedSettings.fromJson(Map<String, dynamic> json) =>
      _$AdvancedSettingsFromJson(json);

  /// Open Old Testament verse hyperlink in module
  final String openOtVerseHyperlinkIn;

  /// Open New Testament verse hyperlink in module
  final String openNtVerseHyperlinkIn;

  /// Default Strong's dictionary module module
  final String defaultStrongsDictionaryModule;

  /// Default Greek dictionary (not Strong's) module module
  final String? defaultGreekDictionaryModule;

  /// Default Hebrew dictionary (not Strong's) module module
  final String? defaultHebrewDictionaryModule;

  /// Convert Advanced settings to JSON
  Map<String, dynamic> toJson() => _$AdvancedSettingsToJson(this);

  /// Get Advanced settings copy
  AdvancedSettings getSettingsCopy() {
    return AdvancedSettings(
      openOtVerseHyperlinkIn: openOtVerseHyperlinkIn,
      openNtVerseHyperlinkIn: openNtVerseHyperlinkIn,
      defaultStrongsDictionaryModule: defaultStrongsDictionaryModule,
      defaultGreekDictionaryModule: defaultGreekDictionaryModule,
      defaultHebrewDictionaryModule: defaultHebrewDictionaryModule,
    );
  }

  /// Advanced settings copy with...
  AdvancedSettings copyWith({
    String? openOtVerseHyperlinkIn,
    String? openNtVerseHyperlinkIn,
    String? defaultStrongsDictionaryModule,
    String? defaultGreekDictionaryModule,
    String? defaultHebrewDictionaryModule,
  }) {
    return AdvancedSettings(
      openOtVerseHyperlinkIn:
          openOtVerseHyperlinkIn ?? this.openOtVerseHyperlinkIn,
      openNtVerseHyperlinkIn:
          openNtVerseHyperlinkIn ?? this.openNtVerseHyperlinkIn,
      defaultStrongsDictionaryModule:
          defaultStrongsDictionaryModule ?? this.defaultStrongsDictionaryModule,
      defaultGreekDictionaryModule:
          defaultGreekDictionaryModule ?? this.defaultGreekDictionaryModule,
      defaultHebrewDictionaryModule:
          defaultHebrewDictionaryModule ?? this.defaultHebrewDictionaryModule,
    );
  }

  @override
  String toString() {
    return 'AdvancedSettings(${toJson()})';
  }

  @override
  List<Object?> get props => [
        openOtVerseHyperlinkIn,
        openNtVerseHyperlinkIn,
        defaultStrongsDictionaryModule,
        defaultGreekDictionaryModule,
        defaultHebrewDictionaryModule,
      ];
}

/// Appearance settings
@JsonSerializable()
class AppearanceSettings extends Equatable {
  /// Appearance settings
  const AppearanceSettings({
    this.theme = 'default',
    this.themeMode = ThemeMode.system,
    this.accentColor = AppearanceSettings.defaultColor,
    this.showLeftRibbon = true,
  });

  /// Parse Appearance settings from JSON
  factory AppearanceSettings.fromJson(Map<String, dynamic> json) =>
      _$AppearanceSettingsFromJson(json);

  /// App main theme
  final String theme;

  /// App theme mode
  final ThemeMode themeMode;

  /// Accent theme HSL color
  @_HexColorConverter()
  final Color accentColor;

  /// Show the left Ribbon?
  final bool showLeftRibbon;

  /// Convert Appearance settings to JSON
  Map<String, dynamic> toJson() => _$AppearanceSettingsToJson(this);

  /// Get Appearance settings copy
  AppearanceSettings getSettingsCopy() {
    return AppearanceSettings(theme: theme, themeMode: themeMode);
  }

  /// Appearance settings copy with...
  AppearanceSettings copyWith({
    String? theme,
    ThemeMode? themeMode,
    Color? accentColor,
    bool? showLeftRibbon,
  }) {
    return AppearanceSettings(
      theme: theme ?? this.theme,
      themeMode: themeMode ?? this.themeMode,
      accentColor: accentColor ?? this.accentColor,
      showLeftRibbon: showLeftRibbon ?? this.showLeftRibbon,
    );
  }

  @override
  String toString() {
    return '''AppearanceSettings($theme, $themeMode, $accentColor, $showLeftRibbon)''';
  }

  @override
  List<Object> get props => [theme, themeMode, accentColor, showLeftRibbon];

  /// Default accent color.
  static const defaultColor = Color(0xFF5B56FB);
}

/// Text Display settings
@JsonSerializable()
class TextDisplaySettings extends Equatable {
  /// Text Display settings
  const TextDisplaySettings({
    this.theme = 'default',
    this.showAs = ETextShowAs.separate,
    this.fontFamily = '',
    this.greekFontFamily = 'SBL-Greek',
    this.hebrewFontFamily = 'SBL-Hebrew',
    this.cuFontFamily = 'Ponomar-CU',
    this.fontSize = 18.0,
    this.fontWeight = FontWeight.normal,
    this.lineHeight = 1.5,
  });

  /// Parse Text Display settings from JSON
  factory TextDisplaySettings.fromJson(Map<String, dynamic> json) =>
      _$TextDisplaySettingsFromJson(json);

  /// Text Display theme
  final String theme;

  /// Text show as...
  final ETextShowAs showAs;

  /// Font family
  final String fontFamily;

  /// Font family for Greek language
  final String greekFontFamily;

  /// Font family for Hebrew language
  final String hebrewFontFamily;

  /// Font family for Church Slavic language
  final String cuFontFamily;

  /// Font size
  final double fontSize;

  /// Font weight
  @_FontWeightConverter()
  final FontWeight fontWeight;

  /// Line height
  final double lineHeight;

  /// Convert Text Display settings to JSON
  Map<String, dynamic> toJson() => _$TextDisplaySettingsToJson(this);

  /// Get Text Display settings copy
  TextDisplaySettings getSettingsCopy() {
    return TextDisplaySettings(
      theme: theme,
      showAs: showAs,
      fontFamily: fontFamily,
      greekFontFamily: greekFontFamily,
      hebrewFontFamily: hebrewFontFamily,
      cuFontFamily: cuFontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      lineHeight: lineHeight,
    );
  }

  /// Text Display settings copy with...
  TextDisplaySettings copyWith({
    String? theme,
    ETextShowAs? showAs,
    String? fontFamily,
    String? greekFontFamily,
    String? hebrewFontFamily,
    String? cuFontFamily,
    double? fontSize,
    FontWeight? fontWeight,
    double? lineHeight,
  }) {
    return TextDisplaySettings(
      theme: theme ?? this.theme,
      showAs: showAs ?? this.showAs,
      fontFamily: fontFamily ?? this.fontFamily,
      greekFontFamily: greekFontFamily ?? this.greekFontFamily,
      hebrewFontFamily: hebrewFontFamily ?? this.hebrewFontFamily,
      cuFontFamily: cuFontFamily ?? this.cuFontFamily,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      lineHeight: lineHeight ?? this.lineHeight,
    );
  }

  @override
  String toString() {
    return 'TextDisplaySettings(${toJson()})';
  }

  @override
  List<Object> get props => [
        theme,
        showAs,
        fontFamily,
        greekFontFamily,
        hebrewFontFamily,
        cuFontFamily,
        fontSize,
        fontWeight,
        lineHeight,
      ];
}

/// Citation settings
@JsonSerializable()
class CitationSettings extends Equatable {
  /// Citation settings
  const CitationSettings({
    this.contentMarkers = const ['"', '"'],
    this.contentShowAs = ETextShowAs.solid,
    this.contentReferencesShowAs = EReferenceShowAs.noReference,
    this.referenceMarkers = const ['', ': '],
    this.referenceLocation = ECitationReferenceLocation.before,
    this.referenceBookNameType = EBookNameType.short,
    this.referenceAbbrMarkers = const ['(', ')'],
    this.referenceAbbrShowAs = EReferenceAbbrShowAs.noAbbr,
    this.noAbbrForModule = 'RST+',
  });

  /// Parse Citation settings from JSON
  factory CitationSettings.fromJson(Map<String, dynamic> json) =>
      _$CitationSettingsFromJson(json);

  /// Content markers
  final List<String> contentMarkers;

  /// Content show as...
  final ETextShowAs contentShowAs;

  /// Content references show as...
  final EReferenceShowAs contentReferencesShowAs;

  /// Reference markers
  final List<String> referenceMarkers;

  /// Reference location
  final ECitationReferenceLocation referenceLocation;

  /// Reference book name type
  final EBookNameType referenceBookNameType;

  /// Reference abbr markers
  final List<String> referenceAbbrMarkers;

  /// Reference abbr show as...
  final EReferenceAbbrShowAs referenceAbbrShowAs;

  /// No abbr for module
  final String noAbbrForModule;

  /// Convert Citation settings to JSON
  Map<String, dynamic> toJson() => _$CitationSettingsToJson(this);

  /// Get Citation settings copy
  CitationSettings getSettingsCopy() {
    return CitationSettings(
      contentMarkers: contentMarkers,
      contentShowAs: contentShowAs,
      contentReferencesShowAs: contentReferencesShowAs,
      referenceMarkers: referenceMarkers,
      referenceLocation: referenceLocation,
      referenceBookNameType: referenceBookNameType,
      referenceAbbrMarkers: referenceAbbrMarkers,
      referenceAbbrShowAs: referenceAbbrShowAs,
      noAbbrForModule: noAbbrForModule,
    );
  }

  /// Citation settings copy with...
  CitationSettings copyWith({
    List<String>? contentMarkers,
    ETextShowAs? contentShowAs,
    EReferenceShowAs? contentReferencesShowAs,
    List<String>? referenceMarkers,
    ECitationReferenceLocation? referenceLocation,
    EBookNameType? referenceBookNameType,
    List<String>? referenceAbbrMarkers,
    EReferenceAbbrShowAs? referenceAbbrShowAs,
    String? noAbbrForModule,
  }) {
    return CitationSettings(
      contentMarkers: contentMarkers ?? this.contentMarkers,
      contentShowAs: contentShowAs ?? this.contentShowAs,
      contentReferencesShowAs:
          contentReferencesShowAs ?? this.contentReferencesShowAs,
      referenceMarkers: referenceMarkers ?? this.referenceMarkers,
      referenceLocation: referenceLocation ?? this.referenceLocation,
      referenceBookNameType:
          referenceBookNameType ?? this.referenceBookNameType,
      referenceAbbrMarkers: referenceAbbrMarkers ?? this.referenceAbbrMarkers,
      referenceAbbrShowAs: referenceAbbrShowAs ?? this.referenceAbbrShowAs,
      noAbbrForModule: noAbbrForModule ?? this.noAbbrForModule,
    );
  }

  @override
  String toString() {
    return 'CitationSettings(${toJson()})';
  }

  @override
  List<Object> get props => [
        contentMarkers,
        contentShowAs,
        contentReferencesShowAs,
        referenceMarkers,
        referenceLocation,
        referenceBookNameType,
        referenceAbbrMarkers,
        referenceAbbrShowAs,
        noAbbrForModule,
      ];
}

class _FontWeightConverter implements JsonConverter<FontWeight, String> {
  const _FontWeightConverter();

  @override
  FontWeight fromJson(String json) => FontWeight.values.firstWhere(
        (item) => item.toString() == json,
        orElse: () => FontWeight.normal,
      );

  @override
  String toJson(FontWeight object) => object.toString();
}

class _HexColorConverter implements JsonConverter<Color, String> {
  const _HexColorConverter();

  @override
  Color fromJson(String json) => HexColor.fromHex(json);

  @override
  String toJson(Color object) => object.toHex();
}

// class _ColorConverter implements JsonConverter<Color, int> {
//   const _ColorConverter();

//   @override
//   Color fromJson(int json) => Color(json);

//   @override
//   int toJson(Color object) => object.value;
// }

// class _HSLColorConverter
//     implements JsonConverter<HSLColor, Map<String, dynamic>> {
//   const _HSLColorConverter();

//   @override
//   HSLColor fromJson(Map<String, dynamic> json) => HSLColor.fromAHSL(
//         double.tryParse(json['alpha']?.toString() ?? '1.0') ?? 1.0,
//         double.tryParse(json['hue']?.toString() ?? '242') ?? 242,
//         double.tryParse(json['saturation']?.toString() ?? '0.95') ?? 0.95,
//         double.tryParse(json['lightness']?.toString() ?? '0.66') ?? 0.66,
//       );

//   @override
//   Map<String, dynamic> toJson(HSLColor object) => {
//         'alpha': object.alpha,
//         'hue': object.hue,
//         'saturation': object.saturation,
//         'lightness': object.lightness,
//       };
// }

/// Languages (ISO 639-1)
enum ELanguage {
  /// English
  en,

  /// Russian
  ru,

  /// Greece
  // el,

  /// Hebrew
  // he,
}

/// Startup session config
enum EStartupSessionConfig {
  /// Default session
  defaultSession,

  /// Last session
  lastSession,
}

/// Text show as...
enum ETextShowAs {
  /// Solid text
  solid,

  /// Paragraphs
  paragraphs,

  /// Paragraphs with space
  paragraphsWithSpace,

  /// Separate verses
  separate,

  /// Separate with space
  separateWithSpace,
}

/// Citation reference location
enum ECitationReferenceLocation {
  /// Above text
  above,

  /// Before text
  before,

  /// After text
  after,

  /// Below text
  below,

  /// No reference
  noReference,
}

/// Reference abbr show as...
enum EReferenceAbbrShowAs {
  /// Before reference
  beforeReference,

  /// After reference
  afterReference,

  /// No abbr
  noAbbr,
}

/// Book name type
enum EBookNameType {
  /// Short book name
  short,

  /// Long book name
  long,
}

/// Reference show as...
enum EReferenceShowAs {
  /// Book, chapter and verse
  bookChapterVerse,

  /// Chapter and verse
  chapterVerse,

  /// Verse only
  verseOnly,

  /// No reference
  noReference,
}
