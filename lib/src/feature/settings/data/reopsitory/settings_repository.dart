import 'dart:async';

import 'package:password_manager/src/feature/settings/data/provider/settings_provider.dart';
import 'package:password_manager/src/feature/settings/model/app_settings.dart';

/// {@template settings_repository}
/// Settings repository of application.
/// {@endtemplate}
abstract class SettingsRepository {
  /// {@macro settings_repository}
  factory SettingsRepository.createInstance({
    required SettingsProvider provider,
  }) =>
      SettingsRepositoryImpl(
        provider: provider,
      );

  /// Current application settings.
  AppSettings get appSettings;

  /// Stream of application settings.
  Stream<AppSettings> get settingsChanges;

  /// Load application settings from current provider.
  /// Create default settings if not exists.
  Future<AppSettings> loadAppSettings();

  /// Save application settings to current provider.
  Future<void> saveAppSettings(AppSettings appSettings);

  /// Reset application settings to default and save to current provider.
  Future<void> resetAppSettings();
}

/// {@macro settings_repository}
class SettingsRepositoryImpl implements SettingsRepository {
  /// {@macro settings_repository}
  SettingsRepositoryImpl({
    required SettingsProvider provider,
  }) : _provider = provider;

  /// {@macro settings_provider}
  final SettingsProvider _provider;

  final StreamController<AppSettings> _settingsController =
      StreamController<AppSettings>.broadcast();

  AppSettings? _appSettings;

  @override
  AppSettings get appSettings =>
      _appSettings ??
      AppSettings.defaultSettings(language: _provider.systemLanguage);

  @override
  Stream<AppSettings> get settingsChanges => _settingsController.stream;

  @override
  Future<AppSettings> loadAppSettings() async {
    final settings = await _provider.loadAppSettings();
    _settingsController.add(_appSettings = settings);
    return _appSettings!;
  }

  @override
  Future<void> saveAppSettings(AppSettings appSettings) async {
    await _provider.saveAppSettings(appSettings);
    _settingsController.add(_appSettings = appSettings);
  }

  @override
  Future<void> resetAppSettings() async {
    final settings =
        AppSettings.defaultSettings(language: _provider.systemLanguage);
    await _provider.saveAppSettings(settings);
    _settingsController.add(_appSettings = settings);
  }
}
