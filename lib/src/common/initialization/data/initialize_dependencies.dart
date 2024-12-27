import 'dart:async';

import 'package:collection/collection.dart';
// import 'package:control/control.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:l/l.dart';
import 'package:password_manager/src/common/constant/config.dart';
import 'package:password_manager/src/common/constant/pubspec.yaml.g.dart';
import 'package:password_manager/src/common/database/database.dart';
import 'package:password_manager/src/common/initialization/data/app_bloc_observer.dart';
import 'package:password_manager/src/common/initialization/data/platform/platform_initialization.dart';
import 'package:password_manager/src/common/localization/generated/app_localizations.dart';
import 'package:password_manager/src/common/model/app_metadata.dart';
import 'package:password_manager/src/common/model/dependencies.dart';
import 'package:password_manager/src/common/util/dio_proxy.dart';
import 'package:password_manager/src/common/util/http_log_interceptor.dart';
import 'package:password_manager/src/common/util/screen_util.dart';
import 'package:password_manager/src/feature/settings/data/provider/db_settings_provider.dart';
import 'package:password_manager/src/feature/settings/settings.dart';
import 'package:platform_info/platform_info.dart';
// import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Initializes the app and returns a [Dependencies] object
Future<Dependencies> $initializeDependencies({
  void Function(int progress, String message)? onProgress,
}) async {
  final dependencies = $MutableDependencies();
  final totalSteps = _initializationSteps.length;
  var currentStep = 0;
  for (final step in _initializationSteps.entries) {
    try {
      currentStep++;
      final percent = (currentStep * 100 ~/ totalSteps).clamp(0, 100);
      // TODO(proteye): removed after tests
      await Future<void>.delayed(const Duration(milliseconds: 100));
      onProgress?.call(percent, step.key);
      l.v6(
        'Initialization | $currentStep/$totalSteps ($percent%) | "${step.key}"',
      );
      await step.value(dependencies);
    } on Object catch (error, stackTrace) {
      l.e('Initialization failed at step "${step.key}": $error', stackTrace);
      Error.throwWithStackTrace(
        'Initialization failed at step "${step.key}": $error',
        stackTrace,
      );
    }
  }
  return dependencies.freeze();
}

typedef _InitializationStep = FutureOr<void> Function(
  $MutableDependencies dependencies,
);
final Map<String, _InitializationStep> _initializationSteps =
    <String, _InitializationStep>{
  'Platform pre-initialization': (_) => $platformInitialization(),
  'Creating app metadata': (dependencies) =>
      dependencies.metadata = AppMetadata(
        isWeb: platform.js,
        isRelease: platform.buildMode.release,
        appName: Pubspec.name,
        appVersion: Pubspec.version.representation,
        appVersionMajor: Pubspec.version.major,
        appVersionMinor: Pubspec.version.minor,
        appVersionPatch: Pubspec.version.patch,
        appBuildTimestamp: Pubspec.version.build.isNotEmpty
            ? (int.tryParse(Pubspec.version.build.firstOrNull ?? '-1') ?? -1)
            : -1,
        operatingSystem: platform.operatingSystem.name,
        processorsCount: platform.numberOfProcessors,
        appLaunchedTimestamp: DateTime.now(),
        locale: platform.locale,
        deviceVersion: platform.version,
        deviceScreenSize: ScreenUtil.screenSize().representation,
      ),
  // 'Observer state managment': (_) =>Controller.observer=ControllerObserver(),
  'Initializing analytics': (_) {},
  'Log app open': (_) {},
  'Get remote config': (_) {},
  'Initialize shared preferences': (dependencies) async =>
      dependencies.sharedPreferences = await SharedPreferences.getInstance(),
  'Connect to database': (dependencies) => (dependencies.database =
          Config.inMemoryDatabase ? Database.memory() : Database.lazy())
      .refresh(),
  'Shrink database': (dependencies) async {
    await dependencies.database.customStatement('VACUUM;');
    await dependencies.database.transaction(() async {
      final log = await (dependencies.database
              .select<LogTbl, LogTblData>(dependencies.database.logTbl)
            ..orderBy([
              (tbl) =>
                  OrderingTerm(expression: tbl.id, mode: OrderingMode.desc),
            ])
            ..limit(1, offset: 1000))
          .getSingleOrNull();
      if (log != null) {
        await (dependencies.database.delete(dependencies.database.logTbl)
              ..where((tbl) => tbl.time.isSmallerOrEqualValue(log.time)))
            .go();
      }
    });
    if (DateTime.now().second % 10 == 0) {
      await dependencies.database.customStatement('VACUUM;');
    }
  },
  // 'Migrate app from previous version': (dependencies) =>
  //     AppMigrator.migrate(dependencies.database),
  'API Client': (dependencies) => dependencies.dio = Dio(
        BaseOptions(
          baseUrl: Config.apiBaseUrl,
          connectTimeout: Config.apiConnectTimeout,
          receiveTimeout: Config.apiReceiveTimeout,
          headers: <String, String>{
            /* 'Connection': 'Close', */
            Headers.acceptHeader: Headers.jsonContentType,
          },
          receiveDataWhenStatusError: false, // Don't convert 4XX & 5XX to JSON
        ),
      )..useProxy(),
  'Add API interceptors': (dependencies) {
    dependencies.dio.interceptors.addAll(<Interceptor>[
      const HttpLogInterceptor(),
      // TODO(proteye): add sentry interceptor
      // TODO(proteye): save all requests to database
      // TODO(proteye): add cache interceptor
      /* AuthenticationInterceptor(
        token: () => authenticator.user.sessionId
        ?? (throw StateError('User is not logged in')),
        logout: () => Future<void>.sync(authenticator.logOut),
        refresh: () => Future<void>.sync(authenticator.refresh),
        retry: (options) => apiClient.fetch(options),
      ), */
      // RetryInterceptor(
      //   dio: dependencies.dio,
      //   logPrint: (message) => l.w('RetryInterceptor | API | $message'),
      //   retries: 3, // retry count (optional)
      //   retryDelays: const <Duration>[
      //     Duration(seconds: 1), // wait 1 sec before first retry
      //     Duration(seconds: 2), // wait 2 sec before second retry
      //     Duration(seconds: 10), // wait 3 sec before third retry
      //   ],
      // ),
    ]);
  },
  // 'Prepare authentication controller': (dependencies) =>
  //     dependencies.authenticationController = AuthenticationController(
  //       repository: AuthenticationRepositoryImpl(
  //         sharedPreferences: dependencies.sharedPreferences,
  //       ),
  //     ),
  // 'Restore last user': (dependencies) =>
  //     dependencies.authenticationController.restore(),
  'Initialize BlocObserver': (dependencies) async {
    Bloc.observer = AppBlocObserver();
  },
  'Initialize localization': (_) {},
  'Initialize cache': (dependencies) async {
    // dependencies.cacheRepository = CacheRepository.createInstance(
    //   provider: LocalCacheProvider(),
    // To use [StorageCacheProvider] replace provider with:
    // provider: StorageCacheProvider(
    //   storage: PersistentStorage(
    //     sharedPreferences: dependencies.sharedPreferences,
    //   ),
    // ),
    // );
  },
  'Restore settings': (dependencies) async {
    // Find device system locale and set default locale from supported.
    final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;
    final defaultLocale = AppLocalizations.supportedLocales.firstWhereOrNull(
      (item) => item.languageCode == deviceLocale.languageCode,
    );
    dependencies.settingsRepository = SettingsRepository.createInstance(
      provider: DbSettingsProvider(
        database: dependencies.database,
        systemLanguage: defaultLocale?.languageCode,
      ),
    );
    // Load current settings of application.
    await dependencies.settingsRepository.loadAppSettings();
  },
  'Restore library': (dependencies) async {
    // dependencies.libraryRepository = LibraryRepository.createInstance(
    //   provider: DbLibraryProvider(database: dependencies.database),
    // );
    // await dependencies.libraryRepository.loadLibrary();
  },
  'Restore workspace': (dependencies) async {
    // dependencies.workspaceRepository = WorkspaceRepository.createInstance(
    //   provider: DbWorkspaceProvider(database: dependencies.database),
    // );
    // await dependencies.workspaceRepository.loadWorkspace();
  },
  // 'Collect logs': (dependencies) async {
  //   await (dependencies.database
  //           .select<LogTbl, LogTblData>(dependencies.database.logTbl)
  //         ..orderBy([
  //           (tbl) => OrderingTerm(expression:tbl.time,mode:OrderingMode.desc)
  //         ])
  //         ..limit(LogBuffer.bufferLimit))
  //       .get()
  //       .then<List<LogMessage>>((logs) => logs
  //           .map((l) => l.stack != null
  //               ? LogMessageError(
  //                   timestamp:
  //                       DateTime.fromMillisecondsSinceEpoch(l.time * 1000),
  //                   level: LogLevel.fromValue(l.level),
  //                   message: l.message,
  //                   stackTrace: StackTrace.fromString(l.stack!))
  //               : LogMessageVerbose(
  //                   timestamp:
  //                       DateTime.fromMillisecondsSinceEpoch(l.time * 1000),
  //                   level: LogLevel.fromValue(l.level),
  //                   message: l.message,
  //                 ))
  //           .toList())
  //       .then<void>(LogBuffer.instance.addAll);
  //   l
  //       .bufferTime(const Duration(seconds: 1))
  //       .where((logs) => logs.isNotEmpty)
  //       .listen(LogBuffer.instance.addAll);
  //   l
  //       .map<LogTblCompanion>((log) => LogTblCompanion.insert(
  //             level: log.level.level,
  //             message: log.message.toString(),
  //             time: Value<int>(log.timestamp.millisecondsSinceEpoch ~/ 1000),
  //             stack: Value<String?>(switch (log) {
  //               LogMessageError l => l.stackTrace.toString(),
  //               _ => null
  //             }),
  //           ))
  //       .bufferTime(const Duration(seconds: 5))
  //       .where((logs) => logs.isNotEmpty)
  //       .listen(
  //         (logs) => dependencies.database
  //             .batch((batch) =>
  //                 batch.insertAll(dependencies.database.logTbl, logs))
  //             .ignore(),
  //         cancelOnError: false,
  //       );
  // },
  'Log app initialized': (_) {},
};
