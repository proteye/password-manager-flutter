import 'dart:async';

import 'package:password_manager/src/feature/settings/data/provider/settings_provider.dart';
import 'package:password_manager/src/feature/settings/data/reopsitory/settings_result.dart';
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
  Future<SettingsResult> restoreAppSettings();

  /// Save application settings to current provider.
  Future<SettingsResult> saveAppSettings(AppSettings settings);

  /// Reset application settings to default and save to current provider.
  Future<SettingsResult> resetAppSettings();
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
      _appSettings ?? AppSettings.create(language: _provider.systemLanguage);

  @override
  Stream<AppSettings> get settingsChanges => _settingsController.stream;

  @override
  Future<SettingsResult> restoreAppSettings() async {
    try {
      final settings = await _provider.loadAppSettings();
      _settingsController.add(_appSettings = settings);
      return SettingsResult$Success(appSettings: settings);
    } catch (e, st) {
      return SettingsResult$Failure(error: e, stackTrace: st);
    }
  }

  @override
  Future<SettingsResult> saveAppSettings(AppSettings settings) async {
    try {
      await _provider.saveAppSettings(settings);
      _settingsController.add(_appSettings = settings);
      return SettingsResult$Success(appSettings: settings);
    } catch (e, st) {
      return SettingsResult$Failure(error: e, stackTrace: st);
    }
  }

  @override
  Future<SettingsResult> resetAppSettings() async {
    try {
      final settings = AppSettings.create(language: _provider.systemLanguage);
      await _provider.saveAppSettings(settings);
      _settingsController.add(_appSettings = settings);
      return SettingsResult$Success(appSettings: settings);
    } catch (e, st) {
      return SettingsResult$Failure(error: e, stackTrace: st);
    }
  }
}
