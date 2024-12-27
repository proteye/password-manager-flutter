part of 'settings_bloc.dart';

enum ESettingsSection {
  general,
  advanced,
  appearance,
  textDisplay,
  citation,
}

sealed class SettingsState extends Equatable {
  const SettingsState({
    this.appSettings,
    this.currentSection = ESettingsSection.general,
  });

  final AppSettings? appSettings;
  final ESettingsSection currentSection;

  @override
  List<Object?> get props => [appSettings, currentSection];
}

final class SettingsState$Idle extends SettingsState {
  const SettingsState$Idle({
    required super.appSettings,
    super.currentSection,
  });

  SettingsState$Idle copyWith({
    AppSettings? appSettings,
    ESettingsSection? currentSection,
  }) {
    return SettingsState$Idle(
      appSettings: appSettings ?? this.appSettings,
      currentSection: currentSection ?? this.currentSection,
    );
  }
}

final class SettingsState$Processing extends SettingsState {
  const SettingsState$Processing({
    super.appSettings,
    super.currentSection,
  });
}

final class SettingsState$Failure extends SettingsState {
  const SettingsState$Failure({
    super.appSettings,
    super.currentSection,
  });
}
