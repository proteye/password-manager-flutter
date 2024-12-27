import 'package:flutter/material.dart';
import 'package:password_manager/src/common/initialization/data/initialization.dart';
import 'package:password_manager/src/common/initialization/widgets/inherited_dependencies.dart';
import 'package:password_manager/src/common/initialization/widgets/initialization_splash_screen.dart';
import 'package:password_manager/src/common/util/app_zone.dart';
import 'package:password_manager/src/common/util/error_util.dart';
import 'package:password_manager/src/common/widget/app.dart';
import 'package:password_manager/src/common/widget/app_error.dart';
import 'package:password_manager/src/feature/settings/widget/settings_scope.dart';

void main() => appZone(
      () async {
        // Splash screen
        final initializationProgress =
            ValueNotifier<({int progress, String message})>(
          (progress: 0, message: ''),
        );
        runApp(InitializationSplashScreen(progress: initializationProgress));
        $initializeApp(
          onProgress: (progress, message) => initializationProgress.value =
              (progress: progress, message: message),
          onSuccess: (dependencies) => runApp(
            InheritedDependencies(
              dependencies: dependencies,
              child: const SettingsScope(
                child: App(),
              ),
            ),
          ),
          onError: (error, stackTrace) {
            runApp(AppError(error: error));
            ErrorUtil.logError(error, stackTrace).ignore();
          },
        ).ignore();
      },
    );
