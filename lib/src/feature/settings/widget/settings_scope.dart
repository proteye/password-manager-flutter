import 'package:flutter/material.dart';
import 'package:password_manager/src/common/model/dependencies.dart';
import 'package:password_manager/src/feature/settings/controller/settings_controller.dart';
import 'package:password_manager/src/feature/settings/model/app_settings.dart';

/// {@template settings_scope}
/// Scope settings controller to context.
/// {@endtemplate}
class SettingsScope extends StatefulWidget {
  /// {@macro settings_scope}
  const SettingsScope({
    required this.child,
    super.key,
  });

  static SettingsController _controllerOf(BuildContext context) =>
      _InheritedSettingsScope.stateOf(context)._settingsController;

  static void restoreOf(BuildContext context) =>
      _controllerOf(context).restoreAppSettings();

  static void updateOf(BuildContext context, {required AppSettings settings}) =>
      _controllerOf(context).saveAppSettings(
        settings,
      );

  static AppSettings settingsOf(BuildContext context) =>
      _controllerOf(context).appSettings;

  static Locale localeOf(BuildContext context, {bool listen = true}) =>
      _InheritedSettingsScope.stateOf(context, listen: listen)._locale;

  static ThemeData themeOf(BuildContext context, {bool listen = true}) =>
      _InheritedSettingsScope.stateOf(context, listen: listen)._theme;

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  State<SettingsScope> createState() => _SettingsScopeState();
}

/// State for widget SettingsScope.
class _SettingsScopeState extends State<SettingsScope> {
  late final SettingsController _settingsController;

  Locale _locale = const Locale('en');
  ThemeData _theme = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
    ),
  );

  ThemeMode _themeMode = ThemeMode.system;

  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    _settingsController = SettingsController(
      repository: Dependencies.of(context).settingsRepository,
    )..addListener(_listener);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _update();
  }

  @override
  void dispose() {
    // Permanent removal of a tree stent
    _settingsController.dispose();
    super.dispose();
  }
  /* #endregion */

  void _update() {
    final appSettings = _settingsController.appSettings;
    final brightness = appSettings.themeMode == ThemeMode.system
        ? View.maybeOf(context)?.platformDispatcher.platformBrightness
        : appSettings.themeMode as Brightness;
    _locale = Locale(appSettings.language);
    _theme = ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        brightness: brightness ?? Brightness.light,
        seedColor: Colors.blue,
      ),
    );
    _themeMode = appSettings.themeMode;
  }

  void _listener() {
    if (!mounted) return;
    // Global state update when language or theme or accent color changes.
    if (_settingsController.appSettings.language != _locale.languageCode ||
        _settingsController.appSettings.themeMode != _themeMode) {
      _update();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedSettingsScope(
      scope: this,
      theme: _theme,
      locale: _locale,
      child: widget.child,
    );
  }
}

/// Inherited widget for quick access in the element tree.
class _InheritedSettingsScope extends InheritedWidget {
  const _InheritedSettingsScope({
    required this.scope,
    required this.theme,
    required this.locale,
    required super.child,
  });

  final _SettingsScopeState scope;
  final ThemeData theme;
  final Locale locale;

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  /// For example: `SettingsScope.maybeOf(context)`.
  static _InheritedSettingsScope? maybeOf(
    BuildContext context, {
    bool listen = true,
  }) =>
      listen
          ? context
              .dependOnInheritedWidgetOfExactType<_InheritedSettingsScope>()
          : context.getInheritedWidgetOfExactType<_InheritedSettingsScope>();

  static Never _notFoundInheritedWidgetOfExactType() => throw ArgumentError(
        'Out of scope, not found inherited widget '
            'a _InheritedSettingsScope of the exact type',
        'out_of_scope',
      );

  /// The state from the closest instance of this class
  /// that encloses the given context.
  /// For example: `SettingsScope.of(context)`.
  static _InheritedSettingsScope of(
    BuildContext context, {
    bool listen = true,
  }) =>
      maybeOf(context, listen: listen) ?? _notFoundInheritedWidgetOfExactType();

  static _SettingsScopeState stateOf(
    BuildContext context, {
    bool listen = false,
  }) =>
      of(context, listen: listen).scope;

  @override
  bool updateShouldNotify(covariant _InheritedSettingsScope oldWidget) =>
      !identical(oldWidget.theme, theme) ||
      !identical(oldWidget.locale, locale);
}
