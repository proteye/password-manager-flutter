import 'dart:io';

Future<void> checkAndCreateFolder(String path) async {
  final dir = Directory(path);
  if (!dir.existsSync()) {
    await dir.create(recursive: true);
  }
}
