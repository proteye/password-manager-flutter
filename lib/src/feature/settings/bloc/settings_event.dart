part of 'settings_bloc.dart';

sealed class SettingsEvent {
  const SettingsEvent();
}

class SettingsEvent$Load extends SettingsEvent {
  const SettingsEvent$Load();
}

class SettingsEvent$Update extends SettingsEvent {
  const SettingsEvent$Update(this.settings);

  final AppSettings settings;
}

class SettingsEvent$Reset extends SettingsEvent {
  const SettingsEvent$Reset();
}
