import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:password_manager/src/feature/settings/data/reopsitory/settings_repository.dart';
import 'package:password_manager/src/feature/settings/model/app_settings.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

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
        SettingsEvent$SelectSection() => _selectSection(event, emit),
        SettingsEvent$UpdateGeneral() => _updateGeneral(event, emit),
        SettingsEvent$UpdateAdvanced() => _updateAdvanced(event, emit),
        SettingsEvent$UpdateAppearance() => _updateAppearance(event, emit),
        SettingsEvent$UpdateTextDisplay() => _updateTextDisplay(event, emit),
        SettingsEvent$UpdateCitation() => _updateCitation(event, emit),
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

  /// Update currentSection value when the user tab selected.
  void _selectSection(
    SettingsEvent$SelectSection event,
    Emitter<SettingsState> emit,
  ) {
    if (event.settingsSection != null) {
      emit(
        (state as SettingsState$Idle)
            .copyWith(currentSection: event.settingsSection),
      );
    }
  }

  /// Update General settings.
  Future<void> _updateGeneral(
    SettingsEvent$UpdateGeneral event,
    Emitter<SettingsState> emit,
  ) async {
    final settings =
        await _save(state.appSettings!.copyWith(general: event.general));
    if (settings != null) {
      emit((state as SettingsState$Idle).copyWith(appSettings: settings));
    } else {
      emit(
        SettingsState$Failure(
          appSettings: state.appSettings,
          currentSection: state.currentSection,
        ),
      );
    }
  }

  /// Update Advanced settings.
  Future<void> _updateAdvanced(
    SettingsEvent$UpdateAdvanced event,
    Emitter<SettingsState> emit,
  ) async {
    final settings =
        await _save(state.appSettings!.copyWith(advanced: event.advanced));
    if (settings != null) {
      emit((state as SettingsState$Idle).copyWith(appSettings: settings));
    } else {
      emit(
        SettingsState$Failure(
          appSettings: state.appSettings,
          currentSection: state.currentSection,
        ),
      );
    }
  }

  /// Update Appearance settings.
  Future<void> _updateAppearance(
    SettingsEvent$UpdateAppearance event,
    Emitter<SettingsState> emit,
  ) async {
    final settings =
        await _save(state.appSettings!.copyWith(appearance: event.appearance));
    if (settings != null) {
      emit((state as SettingsState$Idle).copyWith(appSettings: settings));
    } else {
      emit(
        SettingsState$Failure(
          appSettings: state.appSettings,
          currentSection: state.currentSection,
        ),
      );
    }
  }

  /// Update TextDisplay settings.
  Future<void> _updateTextDisplay(
    SettingsEvent$UpdateTextDisplay event,
    Emitter<SettingsState> emit,
  ) async {
    final settings = await _save(
      state.appSettings!.copyWith(textDisplay: event.textDisplay),
    );
    if (settings != null) {
      emit((state as SettingsState$Idle).copyWith(appSettings: settings));
    } else {
      emit(
        SettingsState$Failure(
          appSettings: state.appSettings,
          currentSection: state.currentSection,
        ),
      );
    }
  }

  /// Update Citation settings.
  Future<void> _updateCitation(
    SettingsEvent$UpdateCitation event,
    Emitter<SettingsState> emit,
  ) async {
    final settings =
        await _save(state.appSettings!.copyWith(citation: event.citation));
    if (settings != null) {
      emit((state as SettingsState$Idle).copyWith(appSettings: settings));
    } else {
      emit(
        SettingsState$Failure(
          appSettings: state.appSettings,
          currentSection: state.currentSection,
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
          currentSection: state.currentSection,
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
      developer.log(
        '$e',
        name: 'SettingsBloc._save',
        error: e,
        stackTrace: st,
      );
      addError(e, st);
      await Sentry.captureException(
        e,
        stackTrace: st,
      );
    }
    return null;
  }

  /// Reset and return [AppSettings] or null.
  Future<AppSettings?> _reset() async {
    try {
      await _settingsRepository.resetAppSettings();
      return _settingsRepository.appSettings;
    } catch (e, st) {
      developer.log(
        '$e',
        name: 'SettingsBloc._reset',
        error: e,
        stackTrace: st,
      );
      addError(e, st);
      await Sentry.captureException(
        e,
        stackTrace: st,
      );
    }
    return null;
  }
}
