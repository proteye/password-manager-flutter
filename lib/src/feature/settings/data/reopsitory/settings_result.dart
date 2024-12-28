import 'package:password_manager/src/feature/settings/model/app_settings.dart';

/// {@template settings_result}
/// Settings repository result.
/// {@endtemplate}
sealed class SettingsResult {}

/// {@macro settings_result}
class SettingsResult$Success extends SettingsResult {
  SettingsResult$Success({
    required this.appSettings,
  });

  final AppSettings appSettings;
}

/// {@macro settings_result}
class SettingsResult$Failure extends SettingsResult {
  SettingsResult$Failure({
    this.error,
    this.stackTrace,
  });

  final Object? error;
  final StackTrace? stackTrace;
}
