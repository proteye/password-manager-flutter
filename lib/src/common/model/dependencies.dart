import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart' show BuildContext;
import 'package:password_manager/src/common/database/database.dart';
import 'package:password_manager/src/common/initialization/widgets/inherited_dependencies.dart';
import 'package:password_manager/src/common/model/app_metadata.dart';
import 'package:password_manager/src/feature/settings/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template dependencies}
/// Dependencies injection for the app.
/// {@endtemplate}
abstract interface class Dependencies {
  /// The state from the closest instance of this class.
  factory Dependencies.of(BuildContext context) =>
      InheritedDependencies.of(context);

  /// App metadata
  abstract final AppMetadata metadata;

  /// Shared preferences
  abstract final SharedPreferences sharedPreferences;

  /// Database
  abstract final Database database;

  /// API Client
  abstract final Dio dio;

  /// Cache repository
  // abstract final CacheRepository cacheRepository;

  /// Settings repository
  abstract final SettingsRepository settingsRepository;
}

final class $MutableDependencies implements Dependencies {
  $MutableDependencies() : context = <String, Object?>{};

  /// Initialization context
  final Map<Object?, Object?> context;

  @override
  late AppMetadata metadata;

  @override
  late SharedPreferences sharedPreferences;

  @override
  late Database database;

  @override
  late Dio dio;

  @override
  // late CacheRepository cacheRepository;

  @override
  late SettingsRepository settingsRepository;

  Dependencies freeze() => _$ImmutableDependencies(
        metadata: metadata,
        sharedPreferences: sharedPreferences,
        database: database,
        dio: dio,
        // cacheRepository: cacheRepository,
        settingsRepository: settingsRepository,
      );
}

final class _$ImmutableDependencies implements Dependencies {
  _$ImmutableDependencies({
    required this.metadata,
    required this.sharedPreferences,
    required this.database,
    required this.dio,
    // required this.cacheRepository,
    required this.settingsRepository,
  });

  @override
  final AppMetadata metadata;

  @override
  final SharedPreferences sharedPreferences;

  @override
  final Database database;

  @override
  final Dio dio;

  // @override
  // final CacheRepository cacheRepository;

  @override
  final SettingsRepository settingsRepository;
}
