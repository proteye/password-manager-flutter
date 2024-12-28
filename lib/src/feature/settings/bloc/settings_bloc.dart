import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:password_manager/src/feature/settings/data/reopsitory/settings_repository.dart';
import 'package:password_manager/src/feature/settings/model/app_settings.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required SettingsRepository settingsRepository,
  })  : _settingsRepository = settingsRepository,
        super(const SettingsState$Processing()) {
    on<SettingsEvent>(
      (event, emit) => switch (event) {
        SettingsEvent$Load() => _load(event, emit),
        SettingsEvent$Update() => _updateSettings(event, emit),
        SettingsEvent$Reset() => _resetSettings(event, emit),
      },
    );
  }

  final SettingsRepository _settingsRepository;

  /// Load initial settings.
  Future<void> _load(
    SettingsEvent$Load event,
    Emitter<SettingsState> emit,
  ) async {
    emit(
      SettingsState$Idle(
        appSettings: _settingsRepository.appSettings,
      ),
    );
  }

  /// Update app settings.
  Future<void> _updateSettings(
    SettingsEvent$Update event,
    Emitter<SettingsState> emit,
  ) async {
    final settings = await _save(event.settings);
    if (settings != null) {
      emit((state as SettingsState$Idle).copyWith(appSettings: settings));
    } else {
      emit(
        SettingsState$Failure(
          appSettings: state.appSettings,
          error: 'Failed to update settings',
        ),
      );
    }
  }

  Future<void> _resetSettings(
    SettingsEvent$Reset event,
    Emitter<SettingsState> emit,
  ) async {
    final settings = await _reset();
    if (settings != null) {
      emit((state as SettingsState$Idle).copyWith(appSettings: settings));
    } else {
      emit(
        SettingsState$Failure(
          appSettings: state.appSettings,
          error: 'Failed to reset settings',
        ),
      );
    }
  }

  /// Save and return [AppSettings] or null.
  Future<AppSettings?> _save(AppSettings appSettings) async {
    try {
      await _settingsRepository.saveAppSettings(appSettings);
      return _settingsRepository.appSettings;
    } catch (e, st) {
      addError(e, st);
    }
    return null;
  }

  /// Reset and return [AppSettings] or null.
  Future<AppSettings?> _reset() async {
    try {
      await _settingsRepository.resetAppSettings();
      return _settingsRepository.appSettings;
    } catch (e, st) {
      addError(e, st);
    }
    return null;
  }
}
