part of 'settings_bloc.dart';

sealed class SettingsState extends Equatable {
  const SettingsState({
    this.appSettings,
    this.error,
  });

  final AppSettings? appSettings;
  final Object? error;

  @override
  List<Object?> get props => [appSettings, error];
}

final class SettingsState$Idle extends SettingsState {
  const SettingsState$Idle({
    required super.appSettings,
  });

  SettingsState$Idle copyWith({
    AppSettings? appSettings,
  }) {
    return SettingsState$Idle(
      appSettings: appSettings ?? this.appSettings,
    );
  }
}

final class SettingsState$Processing extends SettingsState {
  const SettingsState$Processing({
    super.appSettings,
  });
}

final class SettingsState$Failure extends SettingsState {
  const SettingsState$Failure({
    super.appSettings,
    super.error,
  });
}
