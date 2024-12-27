import 'dart:io' show Directory;

import 'package:password_manager/src/common/constant/pubspec.yaml.g.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as pp;
import 'package:platform_info/platform_info.dart';

Future<String> $appFolderPath() async {
  var docFolder = await pp.getApplicationDocumentsDirectory();
  if (platform.desktop) {
    docFolder = Directory(p.join(docFolder.path, Pubspec.name));
    if (!docFolder.existsSync()) await docFolder.create(recursive: true);
  }
  return docFolder.path;
}
