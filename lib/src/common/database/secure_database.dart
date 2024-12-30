import 'dart:io' as io;

import 'package:drift/drift.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/widgets.dart'
    show AppLifecycleState, WidgetsBinding, WidgetsBindingObserver;
import 'package:meta/meta.dart';
import 'package:password_manager/src/common/constant/config.dart';
import 'package:password_manager/src/common/database/platform/secure_database_vm.dart'
    // ignore: uri_does_not_exist
    if (dart.library.html) 'package:password_manager/src/common/database/platform/secure_database_js.dart';
import 'package:password_manager/src/common/database/secure_queries.dart';
import 'package:password_manager/src/common/util/crypt_util.dart';
import 'package:password_manager/src/common/util/db_util.dart';

export 'package:drift/drift.dart' hide DatabaseOpener;
export 'package:drift/isolate.dart';

part 'secure_database.g.dart';

abstract interface class IEncryptDatabase {
  Future<void> encryptDb(String password);
  Future<void> decryptDb(String password);
}

@DriftDatabase(
  include: <String>{
    'ddl/credential.drift',
  },
  tables: <Type>[],
  daos: <Type>[],
  queries: $secureQueries,
)
class SecureDatabase extends _$SecureDatabase
    with WidgetsBindingObserver, _CloseOnDetachedAppLifecycleState
    implements GeneratedDatabase, DatabaseConnectionUser, QueryExecutorUser {
  /// Creates a database that will store its result in the [path], creating it
  /// if it doesn't exist.
  ///
  /// [path] - file path to database for native platforms and database name
  /// for web platform.
  ///
  /// If [logStatements] is true (defaults to `false`), generated sql statements
  /// will be printed before executing. This can be useful for debugging.
  /// The optional [setup] function can be used to perform a setup just after
  /// the database is opened, before moor is fully ready. This can be used to
  /// add custom user-defined sql functions or to provide encryption keys in
  /// SQLCipher implementations.
  SecureDatabase.lazy({
    String? path,
    bool logStatements = false,
    bool dropDatabase = Config.dropDatabase,
  }) : super(
          LazyDatabase(
            () => $createQueryExecutor(
              path: path,
              logStatements: logStatements,
              dropDatabase: dropDatabase,
            ),
          ),
        ) {
    _init();
  }

  /// Creates a database from an existing [executor].
  SecureDatabase.connect(super.connection);

  /// Creates an in-memory database won't persist its changes on disk.
  ///
  /// If [logStatements] is true (defaults to `false`), generated sql statements
  /// will be printed before executing. This can be useful for debugging.
  /// The optional [setup] function can be used to perform a setup just after
  /// the database is opened, before moor is fully ready. This can be used to
  /// add custom user-defined sql functions or to provide encryption keys in
  /// SQLCipher implementations.
  SecureDatabase.memory({
    bool logStatements = false,
  }) : super(
          LazyDatabase(
            () => $createQueryExecutor(
              logStatements: logStatements,
              memoryDatabase: true,
            ),
          ),
        );

  /// Refreshes the database contents.
  Future<void> refresh() => select(credentialTbl).get();

  /// Encrypts the database using [password] and save to storage.
  static Future<void> encryptDb({
    required String password,
    bool deleteDbAfterEncrypt = false,
  }) async {
    final key = getKeyByPassword(password);
    final iv = encrypt.IV.fromLength(ivLength);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final dbPath = await getDbPath(
      '${Config.secureDatabaseName}${Config.databaseExtension}',
    );
    final encryptedDbPath = await getDbPath(
      '${Config.secureDatabaseName}${Config.encryptedDatabaseExtension}',
    );
    final dbFile = io.File(dbPath);
    final encryptedDbFile = io.File(encryptedDbPath);
    final bytes = dbFile.readAsBytesSync();
    final encrypted = encrypter.encryptBytes(bytes, iv: iv);
    await encryptedDbFile.writeAsBytes([...iv.bytes, ...encrypted.bytes]);

    if (deleteDbAfterEncrypt) {
      await dbFile.delete();
    }
  }

  /// Decrypts the database using [password] and save to storage.
  static Future<void> decryptDb({
    required String password,
    bool deleteEncryptedDbAfterDecrypt = false,
  }) async {
    final key = getKeyByPassword(password);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    final encryptedDbPath = await getDbPath(
      '${Config.secureDatabaseName}${Config.encryptedDatabaseExtension}',
    );
    final dbPath = await getDbPath(
      '${Config.secureDatabaseName}${Config.databaseExtension}',
    );
    final encryptedDbFile = io.File(encryptedDbPath);
    final dbFile = io.File(dbPath);
    final bytes = await encryptedDbFile.readAsBytes();
    final iv = encrypt.IV(bytes.sublist(0, ivLength));
    final encrypted = encrypt.Encrypted(bytes.sublist(ivLength));
    final decryptedBytes = encrypter.decryptBytes(encrypted, iv: iv);
    await dbFile.writeAsBytes(decryptedBytes);

    if (deleteEncryptedDbAfterDecrypt) {
      await encryptedDbFile.delete();
    }
  }

  static Future<void> removeDb() async {
    final dbPath = await getDbPath(
      '${Config.secureDatabaseName}${Config.databaseExtension}',
    );
    final dbFile = io.File(dbPath);
    if (dbFile.existsSync()) {
      await dbFile.delete();
    }
  }

  /// Length of the IV (initialization vector) used for encryption.
  static const int ivLength = 16;

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => DatabaseMigrationStrategy(
        database: this,
      );
}

/// Handles database migrations by delegating work to [OnCreate] and [OnUpgrade]
/// methods.
@immutable
class DatabaseMigrationStrategy implements MigrationStrategy {
  /// Construct a migration strategy from the provided [onCreate] and
  /// [onUpgrade] methods.
  const DatabaseMigrationStrategy({
    required SecureDatabase database,
  }) : _db = database;

  /// Database to use for migrations.
  final SecureDatabase _db;

  /// Executes when the database is opened for the first time.
  @override
  OnCreate get onCreate => (m) async {
        await m.createAll();
      };

  /// Executes when the database has been opened previously, but the last access
  /// happened at a different [GeneratedDatabase.schemaVersion].
  /// Schema version upgrades and downgrades will both be run here.
  @override
  OnUpgrade get onUpgrade => (m, from, to) async {
        await m.createAll();
        return _update(_db, m, from, to);
      };

  /// Executes after the database is ready to be used (ie. it has been opened
  /// and all migrations ran), but before any other queries will be sent. This
  /// makes it a suitable place to populate data after the database has been
  /// created or set sqlite `PRAGMAS` that you need.
  @override
  OnBeforeOpen get beforeOpen => (details) async {};

  /// https://moor.simonbinder.eu/docs/advanced-features/migrations/
  static Future<void> _update(
    SecureDatabase db,
    Migrator m,
    int from,
    int to,
  ) async {
    await m.createAll();
    if (from >= to) return;
  }
}

mixin _CloseOnDetachedAppLifecycleState
    on WidgetsBindingObserver, GeneratedDatabase {
  void _init() {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) close();
    super.didChangeAppLifecycleState(state);
  }

  @override
  Future<void> close() {
    WidgetsBinding.instance.removeObserver(this);
    return super.close();
  }
}
