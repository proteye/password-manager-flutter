import 'dart:async';

import 'package:control/control.dart';
import 'package:flutter/foundation.dart';
import 'package:password_manager/src/feature/settings/controller/settings_state.dart';
import 'package:password_manager/src/feature/settings/data/reopsitory/settings_repository.dart';
import 'package:password_manager/src/feature/settings/model/app_settings.dart';

final class SettingsController extends StateController<SettingsState>
    with SequentialControllerHandler {
  SettingsController({
    required SettingsRepository repository,
  })  : _repository = repository,
        super(
          initialState: SettingsState.idle(
            appSettings: repository.appSettings,
          ),
        ) {
    _settingsSubscription = repository.settingsChanges
        .where((settings) => !identical(settings, state.appSettings))
        .map<SettingsState>(
          (settings) => SettingsState.idle(appSettings: settings),
        )
        .listen(setState, cancelOnError: false);
  }

  final SettingsRepository _repository;

  AppSettings get appSettings => state.appSettings;

  late StreamSubscription<SettingsState> _settingsSubscription;

  @override
  void dispose() {
    _settingsSubscription.cancel();
    super.dispose();
  }

  void restoreAppSettings() => handle(
        () async {
          setState(
            SettingsState.processing(
              appSettings: state.appSettings,
            ),
          );
          final appSettings = await _repository.loadAppSettings();
          setState(SettingsState.idle(appSettings: appSettings));
        },
        error: (error, _) async {
          setState(
            SettingsState.idle(
              appSettings: state.appSettings,
              // ErrorUtil.formatMessage(error)
              error: kDebugMode
                  ? 'Restore app settings error: $error'
                  : 'Restore app settings error',
            ),
          );
        },
      );

  void saveAppSettings(AppSettings appSettings) => handle(
        () async {
          setState(
            SettingsState.processing(
              appSettings: state.appSettings,
            ),
          );
          await _repository.saveAppSettings(appSettings);
          setState(SettingsState.idle(appSettings: appSettings));
        },
        error: (error, _) async {
          setState(
            SettingsState.idle(
              appSettings: state.appSettings,
              // ErrorUtil.formatMessage(error)
              error: kDebugMode
                  ? 'Save app settings Error: $error'
                  : 'Save app settings Error',
            ),
          );
        },
      );
}
