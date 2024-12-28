import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:password_manager/src/feature/settings/constant/settings_config.dart';

part 'app_settings.g.dart';

/// {@template app_settings}
/// Application settings.
/// {@endtemplate}
@JsonSerializable()
class AppSettings {
  /// {@macro app_settings}
  const AppSettings({
    required this.createDate,
    required this.updateDate,
    this.language = SettingsConfig.defaultLanguage,
    this.themeMode = ThemeMode.system,
    this.pinCodeEnabled = false,
    this.fingerprintEnabled = false,
  });

  AppSettings.create({
    String? language,
    ThemeMode themeMode = ThemeMode.system,
    bool pinCodeEnabled = false,
    bool fingerprintEnabled = false,
  }) : this(
          language: language ?? SettingsConfig.defaultLanguage,
          themeMode: themeMode,
          pinCodeEnabled: pinCodeEnabled,
          fingerprintEnabled: fingerprintEnabled,
          createDate: DateTime.now(),
          updateDate: DateTime.now(),
        );

  AppSettings.empty()
      : this(
          language: SettingsConfig.defaultLanguage,
          themeMode: ThemeMode.system,
          pinCodeEnabled: false,
          fingerprintEnabled: false,
          createDate: DateTime.now(),
          updateDate: DateTime.now(),
        );

  /// Connect the generated [_$AppSettingsFromJson] function to the `fromJson`
  /// factory.
  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);

  /// Language of the application.
  final String language;

  /// App theme mode.
  final ThemeMode themeMode;

  /// Enable PIN code for quick authentication.
  final bool pinCodeEnabled;

  /// Enable Fingerprint authentication.
  final bool fingerprintEnabled;

  /// Date of creation.
  final DateTime createDate;

  /// Date of last update.
  final DateTime updateDate;

  /// Connect the generated [_$AppSettingsToJson] function to the `toJson`
  /// method.
  Map<String, dynamic> toJson() => _$AppSettingsToJson(this);

  /// Check if the app is in light mode.
  bool get isLightMode => themeMode == ThemeMode.light;

  /// Check if the app is in dark mode.
  bool get isDarkMode => themeMode == ThemeMode.dark;

  /// Settings model version.
  static const int version = 1;

  @override
  String toString() {
    return '''AppSettings(language: $language, themeMode: $themeMode, pinCodeEnabled: $pinCodeEnabled, fingerprintEnabled: $fingerprintEnabled, createDate: $createDate, updateDate: $updateDate)''';
  }
}
