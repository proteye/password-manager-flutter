import 'dart:convert';

import 'package:l/l.dart';
import 'package:password_manager/src/common/constant/config.dart';
import 'package:password_manager/src/common/database/database.dart';
import 'package:password_manager/src/feature/settings/data/provider/settings_provider.dart';
import 'package:password_manager/src/feature/settings/model/app_settings.dart';

/// {@macro settings_provider}
/// Load and save settings to database.
class DbSettingsProvider implements SettingsProvider {
  /// {@macro settings_provider}
  DbSettingsProvider({
    required Database database,
    this.systemLanguage,
  }) : _database = database;

  /// Database instance.
  final Database _database;

  /// System language of device.
  @override
  final String? systemLanguage;

  /// Load application settings from database.
  /// Create default settings if not exists.
  @override
  Future<AppSettings> loadAppSettings() async {
    try {
      final settingsData = await (_database
              .select<SettingsTbl, SettingsTblData>(_database.settingsTbl)
            ..where((tbl) => tbl.userId.equals(Config.defaultUserId)))
          .getSingleOrNull();

      if (settingsData == null) {
        final appSettings = AppSettings.create(language: systemLanguage);
        await saveAppSettings(appSettings);
        return appSettings;
      }

      final json = jsonDecode(settingsData.jsonData) as Map<String, dynamic>;
      return AppSettings.fromJson(json);
    } catch (e, st) {
      l.e(e, st);
      final appSettings = AppSettings.create(language: systemLanguage);
      await saveAppSettings(appSettings);
      return appSettings;
    }
  }

  /// Save application settings to database.
  @override
  Future<void> saveAppSettings(AppSettings appSettings) async {
    final json = appSettings.toJson();
    await _database.into(_database.settingsTbl).insertOnConflictUpdate(
          SettingsTblCompanion.insert(
            userId: Config.defaultUserId,
            jsonData: jsonEncode(json),
            version: const Value(AppSettings.version),
          ),
        );
  }
}
