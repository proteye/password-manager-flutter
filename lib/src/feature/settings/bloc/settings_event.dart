part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SettingsEvent$Load extends SettingsEvent {
  const SettingsEvent$Load();
}

class SettingsEvent$SelectSection extends SettingsEvent {
  const SettingsEvent$SelectSection(this.settingsSection);

  final ESettingsSection? settingsSection;
}

class SettingsEvent$UpdateGeneral extends SettingsEvent {
  const SettingsEvent$UpdateGeneral(this.general);

  final GeneralSettings general;
}

class SettingsEvent$UpdateAdvanced extends SettingsEvent {
  const SettingsEvent$UpdateAdvanced(this.advanced);

  final AdvancedSettings advanced;
}

class SettingsEvent$UpdateAppearance extends SettingsEvent {
  const SettingsEvent$UpdateAppearance(this.appearance);

  final AppearanceSettings appearance;
}

class SettingsEvent$UpdateTextDisplay extends SettingsEvent {
  const SettingsEvent$UpdateTextDisplay(this.textDisplay);

  final TextDisplaySettings textDisplay;
}

class SettingsEvent$UpdateCitation extends SettingsEvent {
  const SettingsEvent$UpdateCitation(this.citation);

  final CitationSettings citation;
}

class SettingsEvent$Reset extends SettingsEvent {
  const SettingsEvent$Reset();
}
