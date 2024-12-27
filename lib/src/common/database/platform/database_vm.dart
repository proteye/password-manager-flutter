import 'dart:io' as io;

import 'package:drift/drift.dart';
import 'package:drift/native.dart' as ffi;
import 'package:flutter/foundation.dart';
import 'package:l/l.dart';
import 'package:meta/meta.dart';
import 'package:password_manager/src/common/constant/config.dart';
import 'package:password_manager/src/common/util/app_folder.dart';
import 'package:path/path.dart' as p;

@internal
Future<QueryExecutor> $createQueryExecutor({
  String? path,
  bool logStatements = false,
  bool dropDatabase = false,
  bool memoryDatabase = false,
}) async {
  // Put this somewhere before you open your first VmDatabase

  if (kDebugMode) {
    // Close existing instances for hot restart
    try {
      // Crashes on MacOS!
      // ffi.NativeDatabase.closeExistingInstances();
    } on Object catch (e, st) {
      l.w("Can't close existing database instances, error: $e", st);
    }
  }

  if (memoryDatabase) {
    return ffi.NativeDatabase.memory(
      logStatements: logStatements,
      /* setup: (db) {}, */
    );
  }
  io.File file;
  if (path == null) {
    try {
      final appPath = await appFolderPath();
      file = io.File(
        p.join(appPath, Config.databaseFolder, '${Config.databaseName}.db'),
      );
    } on Object catch (error, stackTrace) {
      Error.throwWithStackTrace(
        'Failed to get application documents directory "$error"',
        stackTrace,
      );
    }
  } else {
    file = io.File(path);
  }
  try {
    if (dropDatabase && file.existsSync()) {
      await file.delete();
    }
  } on Object catch (e, st) {
    l.e("Can't delete database file: $file, error: $e", st);
    rethrow;
  }
  /* return ffi.NativeDatabase(
    file,
    logStatements: logStatements,
    /* setup: (db) {}, */
  ); */
  return ffi.NativeDatabase.createInBackground(
    file,
    logStatements: logStatements,
    /* setup: (db) {}, */
  );
}
