import 'package:password_manager/src/feature/settings/model/app_settings.dart';

/// {@template settings_provider}
/// Settings provider for repository.
/// {@endtemplate}
abstract class SettingsProvider {
  /// System language of device.
  String? get systemLanguage;

  /// Load application settings from current provider.
  /// Create default settings if not exists.
  Future<AppSettings> loadAppSettings();

  /// Save application settings to current provider.
  Future<void> saveAppSettings(AppSettings appSettings);
}
