import 'dart:io' as io;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:password_manager/src/common/constant/config.dart';
import 'package:window_manager/window_manager.dart';

Future<void> $platformInitialization() =>
    io.Platform.isAndroid || io.Platform.isIOS
        ? _mobileInitialization()
        : _desktopInitialization();

Future<void> _mobileInitialization() async {}

Future<void> _desktopInitialization() async {
  await windowManager.ensureInitialized();
  // final screens = PlatformDispatcher.instance.displays;
  // final pixelRatio = screens.first.devicePixelRatio;
  // final screenSize = Size(
  //   screens.first.size.width / pixelRatio,
  //   screens.first.size.height / pixelRatio,
  // );
  // final width = screenSize.width > Config.minScreenWidth
  //     ? screenSize.width * 0.6
  //     : screenSize.width * 0.8;
  // final height = width * 0.75;
  final windowOptions = WindowOptions(
    minimumSize: const Size(320, 480),
    // size: Size(width, height),
    // center: true,
    backgroundColor:
        PlatformDispatcher.instance.platformBrightness == Brightness.dark
            ? ThemeData.dark().colorScheme.surface
            : ThemeData.light().colorScheme.surface,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
    fullScreen: false,
    title: Config.appName,
  );
  await windowManager.waitUntilReadyToShow(
    windowOptions,
    () async {
      if (io.Platform.isMacOS) {
        await windowManager.setMovable(true);
      }
      await windowManager.setMaximizable(false);
      await windowManager.show();
      await windowManager.focus();
    },
  );
}
