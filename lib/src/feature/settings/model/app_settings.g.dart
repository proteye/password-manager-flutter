// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => AppSettings(
      general: json['general'] == null
          ? const GeneralSettings()
          : GeneralSettings.fromJson(json['general'] as Map<String, dynamic>),
      advanced: json['advanced'] == null
          ? const AdvancedSettings()
          : AdvancedSettings.fromJson(json['advanced'] as Map<String, dynamic>),
      appearance: json['appearance'] == null
          ? const AppearanceSettings()
          : AppearanceSettings.fromJson(
              json['appearance'] as Map<String, dynamic>),
      textDisplay: json['textDisplay'] == null
          ? const TextDisplaySettings()
          : TextDisplaySettings.fromJson(
              json['textDisplay'] as Map<String, dynamic>),
      citation: json['citation'] == null
          ? const CitationSettings()
          : CitationSettings.fromJson(json['citation'] as Map<String, dynamic>),
      version: (json['version'] as num?)?.toInt() ?? SettingsConfig.version,
    );

Map<String, dynamic> _$AppSettingsToJson(AppSettings instance) =>
    <String, dynamic>{
      'general': instance.general,
      'advanced': instance.advanced,
      'appearance': instance.appearance,
      'textDisplay': instance.textDisplay,
      'citation': instance.citation,
      'version': instance.version,
    };

GeneralSettings _$GeneralSettingsFromJson(Map<String, dynamic> json) =>
    GeneralSettings(
      startup: $enumDecodeNullable(
              _$EStartupSessionConfigEnumMap, json['startup']) ??
          EStartupSessionConfig.lastSession,
      language: $enumDecodeNullable(_$ELanguageEnumMap, json['language']) ??
          ELanguage.en,
    );

Map<String, dynamic> _$GeneralSettingsToJson(GeneralSettings instance) =>
    <String, dynamic>{
      'startup': _$EStartupSessionConfigEnumMap[instance.startup]!,
      'language': _$ELanguageEnumMap[instance.language]!,
    };

const _$EStartupSessionConfigEnumMap = {
  EStartupSessionConfig.defaultSession: 'defaultSession',
  EStartupSessionConfig.lastSession: 'lastSession',
};

const _$ELanguageEnumMap = {
  ELanguage.en: 'en',
  ELanguage.ru: 'ru',
};

AdvancedSettings _$AdvancedSettingsFromJson(Map<String, dynamic> json) =>
    AdvancedSettings(
      openOtVerseHyperlinkIn:
          json['openOtVerseHyperlinkIn'] as String? ?? 'RST+',
      openNtVerseHyperlinkIn:
          json['openNtVerseHyperlinkIn'] as String? ?? 'RST+',
      defaultStrongsDictionaryModule:
          json['defaultStrongsDictionaryModule'] as String? ??
              'СтрДв.dictionary',
      defaultGreekDictionaryModule:
          json['defaultGreekDictionaryModule'] as String?,
      defaultHebrewDictionaryModule:
          json['defaultHebrewDictionaryModule'] as String?,
    );

Map<String, dynamic> _$AdvancedSettingsToJson(AdvancedSettings instance) =>
    <String, dynamic>{
      'openOtVerseHyperlinkIn': instance.openOtVerseHyperlinkIn,
      'openNtVerseHyperlinkIn': instance.openNtVerseHyperlinkIn,
      'defaultStrongsDictionaryModule': instance.defaultStrongsDictionaryModule,
      'defaultGreekDictionaryModule': instance.defaultGreekDictionaryModule,
      'defaultHebrewDictionaryModule': instance.defaultHebrewDictionaryModule,
    };

AppearanceSettings _$AppearanceSettingsFromJson(Map<String, dynamic> json) =>
    AppearanceSettings(
      theme: json['theme'] as String? ?? 'default',
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
          ThemeMode.system,
      accentColor: json['accentColor'] == null
          ? AppearanceSettings.defaultColor
          : const _HexColorConverter().fromJson(json['accentColor'] as String),
      showLeftRibbon: json['showLeftRibbon'] as bool? ?? true,
    );

Map<String, dynamic> _$AppearanceSettingsToJson(AppearanceSettings instance) =>
    <String, dynamic>{
      'theme': instance.theme,
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'accentColor': const _HexColorConverter().toJson(instance.accentColor),
      'showLeftRibbon': instance.showLeftRibbon,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

TextDisplaySettings _$TextDisplaySettingsFromJson(Map<String, dynamic> json) =>
    TextDisplaySettings(
      theme: json['theme'] as String? ?? 'default',
      showAs: $enumDecodeNullable(_$ETextShowAsEnumMap, json['showAs']) ??
          ETextShowAs.separate,
      fontFamily: json['fontFamily'] as String? ?? '',
      greekFontFamily: json['greekFontFamily'] as String? ?? 'SBL-Greek',
      hebrewFontFamily: json['hebrewFontFamily'] as String? ?? 'SBL-Hebrew',
      cuFontFamily: json['cuFontFamily'] as String? ?? 'Ponomar-CU',
      fontSize: (json['fontSize'] as num?)?.toDouble() ?? 18.0,
      fontWeight: json['fontWeight'] == null
          ? FontWeight.normal
          : const _FontWeightConverter().fromJson(json['fontWeight'] as String),
      lineHeight: (json['lineHeight'] as num?)?.toDouble() ?? 1.5,
    );

Map<String, dynamic> _$TextDisplaySettingsToJson(
        TextDisplaySettings instance) =>
    <String, dynamic>{
      'theme': instance.theme,
      'showAs': _$ETextShowAsEnumMap[instance.showAs]!,
      'fontFamily': instance.fontFamily,
      'greekFontFamily': instance.greekFontFamily,
      'hebrewFontFamily': instance.hebrewFontFamily,
      'cuFontFamily': instance.cuFontFamily,
      'fontSize': instance.fontSize,
      'fontWeight': const _FontWeightConverter().toJson(instance.fontWeight),
      'lineHeight': instance.lineHeight,
    };

const _$ETextShowAsEnumMap = {
  ETextShowAs.solid: 'solid',
  ETextShowAs.paragraphs: 'paragraphs',
  ETextShowAs.paragraphsWithSpace: 'paragraphsWithSpace',
  ETextShowAs.separate: 'separate',
  ETextShowAs.separateWithSpace: 'separateWithSpace',
};

CitationSettings _$CitationSettingsFromJson(Map<String, dynamic> json) =>
    CitationSettings(
      contentMarkers: (json['contentMarkers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ['"', '"'],
      contentShowAs:
          $enumDecodeNullable(_$ETextShowAsEnumMap, json['contentShowAs']) ??
              ETextShowAs.solid,
      contentReferencesShowAs: $enumDecodeNullable(
              _$EReferenceShowAsEnumMap, json['contentReferencesShowAs']) ??
          EReferenceShowAs.noReference,
      referenceMarkers: (json['referenceMarkers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ['', ': '],
      referenceLocation: $enumDecodeNullable(
              _$ECitationReferenceLocationEnumMap, json['referenceLocation']) ??
          ECitationReferenceLocation.before,
      referenceBookNameType: $enumDecodeNullable(
              _$EBookNameTypeEnumMap, json['referenceBookNameType']) ??
          EBookNameType.short,
      referenceAbbrMarkers: (json['referenceAbbrMarkers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ['(', ')'],
      referenceAbbrShowAs: $enumDecodeNullable(
              _$EReferenceAbbrShowAsEnumMap, json['referenceAbbrShowAs']) ??
          EReferenceAbbrShowAs.noAbbr,
      noAbbrForModule: json['noAbbrForModule'] as String? ?? 'RST+',
    );

Map<String, dynamic> _$CitationSettingsToJson(CitationSettings instance) =>
    <String, dynamic>{
      'contentMarkers': instance.contentMarkers,
      'contentShowAs': _$ETextShowAsEnumMap[instance.contentShowAs]!,
      'contentReferencesShowAs':
          _$EReferenceShowAsEnumMap[instance.contentReferencesShowAs]!,
      'referenceMarkers': instance.referenceMarkers,
      'referenceLocation':
          _$ECitationReferenceLocationEnumMap[instance.referenceLocation]!,
      'referenceBookNameType':
          _$EBookNameTypeEnumMap[instance.referenceBookNameType]!,
      'referenceAbbrMarkers': instance.referenceAbbrMarkers,
      'referenceAbbrShowAs':
          _$EReferenceAbbrShowAsEnumMap[instance.referenceAbbrShowAs]!,
      'noAbbrForModule': instance.noAbbrForModule,
    };

const _$EReferenceShowAsEnumMap = {
  EReferenceShowAs.bookChapterVerse: 'bookChapterVerse',
  EReferenceShowAs.chapterVerse: 'chapterVerse',
  EReferenceShowAs.verseOnly: 'verseOnly',
  EReferenceShowAs.noReference: 'noReference',
};

const _$ECitationReferenceLocationEnumMap = {
  ECitationReferenceLocation.above: 'above',
  ECitationReferenceLocation.before: 'before',
  ECitationReferenceLocation.after: 'after',
  ECitationReferenceLocation.below: 'below',
  ECitationReferenceLocation.noReference: 'noReference',
};

const _$EBookNameTypeEnumMap = {
  EBookNameType.short: 'short',
  EBookNameType.long: 'long',
};

const _$EReferenceAbbrShowAsEnumMap = {
  EReferenceAbbrShowAs.beforeReference: 'beforeReference',
  EReferenceAbbrShowAs.afterReference: 'afterReference',
  EReferenceAbbrShowAs.noAbbr: 'noAbbr',
};
