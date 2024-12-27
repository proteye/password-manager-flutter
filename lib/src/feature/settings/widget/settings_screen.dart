import 'package:flutter/material.dart';

/// {@template settings_screen}
/// Settings screen.
/// {@endtemplate}
class SettingsScreen extends StatefulWidget {
  /// {@macro settings_screen}
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
    // return ui.Modal(
    //   closeButtonTooltip: context.l10n.close,
    //   content: BlocProvider<SettingsBloc>(
    //     create: (_) => SettingsBloc(
    //       settingsRepository: Dependencies.of(context).settingsRepository,
    //       libraryRepository: Dependencies.of(context).libraryRepository,
    //     )
    //       // Load initial settings.
    //       ..add(const SettingsEvent$Load()),
    //     child: const _SettingsView(),
    //   ),
    // );
  }
}
