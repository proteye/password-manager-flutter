import 'package:password_manager/src/common/util/platform/app_folder_vm.dart'
    // ignore: uri_does_not_exist
    if (dart.library.html) 'package:password_manager/src/common/util/platform/app_folder_js.dart';

Future<String> appFolderPath() => $appFolderPath();
