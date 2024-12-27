import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:octopus/octopus.dart';
import 'package:password_manager/src/common/constant/config.dart';
import 'package:password_manager/src/common/initialization/widgets/inherited_dependencies.dart';
import 'package:password_manager/src/common/localization/generated/app_localizations.dart';
import 'package:password_manager/src/common/router/router_state_mixin.dart';
import 'package:password_manager/src/feature/settings/data/reopsitory/settings_repository.dart';
import 'package:password_manager/src/feature/settings/widget/settings_scope.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with RouterStateMixin {
  // Disable recreate widget tree.
  final Key builderKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SettingsRepository>.value(
          value: InheritedDependencies.of(context).settingsRepository,
        ),
        // RepositoryProvider<LibraryRepository>.value(
        //   value: InheritedDependencies.of(context).libraryRepository,
        // ),
        // RepositoryProvider<WorkspaceRepository>.value(
        //   value: InheritedDependencies.of(context).workspaceRepository,
        // ),
        // RepositoryProvider<CacheRepository>.value(
        //   value: InheritedDependencies.of(context).cacheRepository,
        // ),
        // BlocProvider<AppCubit>(
        //   create: (_) => AppCubit(
        //     settingsRepository:
        //         InheritedDependencies.of(context).settingsRepository,
        //   )..init(),
        // ),
      ],
      child: MaterialApp.router(
        title: Config.appName,
        debugShowCheckedModeBanner: !Config.environment.isProduction,

        // Router
        routerConfig: router.config,

        // Localizations
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: SettingsScope.localeOf(context),

        // Theme
        theme: SettingsScope.themeOf(context),
        themeMode: SettingsScope.settingsOf(context).themeMode,

        // Scopes
        builder: (context, child) => MediaQuery(
          key: builderKey,
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling,
          ),
          child: OctopusTools(
            octopus: router,
            child: child ?? const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}

// class _App extends StatelessWidget {
//   const _App({
//     super.key, // ignore: unused_element
//   });

//   void _updateSettings(BuildContext context) {
//     final settings = SettingsScope.settingsOf(context);
//     SettingsScope.updateOf(
//       context,
//       settings: settings.copyWith(
//         general: settings.general.copyWith(
//           startup:
//               settings.general.startup==EStartupSessionConfig.defaultSession
//                   ? EStartupSessionConfig.lastSession
//                   : EStartupSessionConfig.defaultSession,
//           language: settings.general.language == ELanguage.en
//               ? ELanguage.ru
//               : ELanguage.en,
//         ),
//         appearance: settings.appearance.copyWith(
//           accentColor: settings.general.language == ELanguage.en
//               ? Colors.red
//               : Colors.green,
//           themeMode: settings.general.language == ELanguage.en
//               ? ThemeMode.light
//               : ThemeMode.dark,
//         ),
//       ),
//     );
//   }

//   Future<void> _showSettings(BuildContext context) async {
//     return showDialog(
//       context: context,
//       barrierColor: context.themeColors.backgroundModifierCover,
//       builder: (_) => Modal(
//         closeButtonTooltip: context.l10n.close,
//         content: const SettingsPage(),
//       ),
//     );
//   }

//   Future<void> _showLibrary(BuildContext context) async {
//     return showDialog(
//       context: context,
//       barrierColor: context.themeColors.backgroundModifierCover,
//       builder: (_) => Modal(
//         closeButtonTooltip: context.l10n.close,
//         content: const LibraryPage(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ColoredBox(
//       color: Theme.of(context).colorScheme.surface,
//       child: Center(
//         child: TextButton(
//           style: ButtonStyle(
//             backgroundColor:
//                 WidgetStatePropertyAll(context.themeColors.accentColor),
//           ),
//           onPressed: () => _showLibrary(context),
//           child: Text(context.l10n.modules),
//         ),
//       ),
//     );
//   }
// }
