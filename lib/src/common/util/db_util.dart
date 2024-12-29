import 'package:password_manager/src/common/constant/config.dart';
import 'package:password_manager/src/common/util/app_folder.dart';
import 'package:path/path.dart' as p;

/// Returns the database path by its [filename].
Future<String> getDbPath(String filename) async {
  final appPath = await appFolderPath();
  return p.join(
    appPath,
    Config.databaseFolder,
    filename,
  );
}
