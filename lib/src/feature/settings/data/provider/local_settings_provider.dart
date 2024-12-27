import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:password_manager/src/common/util/app_folder.dart';
import 'package:password_manager/src/common/util/file_util.dart';
import 'package:password_manager/src/feature/settings/constant/settings_config.dart';
import 'package:password_manager/src/feature/settings/data/provider/settings_provider.dart';
import 'package:password_manager/src/feature/settings/model/app_settings.dart';
import 'package:path/path.dart' as p;

/// {@macro settings_provider}
/// Load and save settings to local file.
class LocalSettingsProvider implements SettingsProvider {
  /// {@macro settings_provider}
  LocalSettingsProvider({
    this.systemLanguage,
    this.rootDirPath,
  });

  /// Root local directory path.
  final Future<String> Function()? rootDirPath;

  /// System language of device.
  @override
  final String? systemLanguage;

  /// Local path cache.
  String? _localPath;

  /// Load application settings from local file.
  /// Create default settings if not exists.
  @override
  Future<AppSettings> loadAppSettings() async {
    try {
      final filePath = await _localFilePath(SettingsConfig.filename);
      final settingsFile = File(filePath);

      if (!settingsFile.existsSync()) {
        final appSettings =
            AppSettings.defaultSettings(language: systemLanguage);
        await saveAppSettings(appSettings);
        return appSettings;
      }

      final json =
          jsonDecode(settingsFile.readAsStringSync()) as Map<String, dynamic>;

      return AppSettings.fromJson(json);
    } catch (e, s) {
      developer.log(
        '$e',
        name: 'LocalSettingsProvider.loadAppSettings',
        error: e,
        stackTrace: s,
      );
      final appSettings = AppSettings.defaultSettings(language: systemLanguage);
      await saveAppSettings(appSettings);
      return appSettings;
    }
  }

  /// Save application settings to local file.
  @override
  Future<void> saveAppSettings(AppSettings appSettings) async {
    try {
      final filePath = await _localFilePath(SettingsConfig.filename);
      final settingsFile = File(filePath);
      final json = appSettings.toJson();
      await settingsFile.writeAsString(jsonEncode(json));
    } catch (e, s) {
      developer.log(
        '$e',
        name: 'LocalSettingsProvider.saveAppSettings',
        error: e,
        stackTrace: s,
      );
    }
  }

  Future<String> _localFilePath(String filename) async {
    final path = await _getLocalPath();
    return '$path/$filename';
  }

  Future<String> _getLocalPath() async {
    if (_localPath == null) {
      String directoryPath;
      if (rootDirPath != null) {
        directoryPath = await rootDirPath!();
      } else {
        directoryPath = await appFolderPath();
      }
      _localPath = p.join(directoryPath, SettingsConfig.folder);
      await checkAndCreateFolder(_localPath!);
    }
    return _localPath!;
  }
}
