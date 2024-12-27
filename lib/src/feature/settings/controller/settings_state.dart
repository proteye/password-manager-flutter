import 'package:equatable/equatable.dart';
import 'package:password_manager/src/feature/settings/model/app_settings.dart';

/// {@template settings_state}
/// Settings state.
/// {@endtemplate}
sealed class SettingsState extends Equatable {
  /// {@macro settings_state}
  const SettingsState({
    required this.appSettings,
    this.error,
  });

  /// Idling state.
  /// {@macro settings_state}
  const factory SettingsState.idle({
    required AppSettings appSettings,
    String? error,
  }) = SettingsState$Idle;

  /// Processing.
  /// {@macro settings_state}
  const factory SettingsState.processing({
    required AppSettings appSettings,
  }) = SettingsState$Processing;

  /// {@macro app_settings}
  final AppSettings appSettings;

  /// Error message.
  final String? error;

  @override
  List<Object?> get props => [appSettings, error];
}

class SettingsState$Idle extends SettingsState {
  const SettingsState$Idle({
    required super.appSettings,
    super.error,
  });
}

class SettingsState$Processing extends SettingsState {
  const SettingsState$Processing({
    required super.appSettings,
  });
}
