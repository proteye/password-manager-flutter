import 'package:flutter/material.dart';
import 'package:password_manager/src/common/widget/logo.dart';

/// {@template app_error}
/// AppError widget
/// {@endtemplate}
class AppError extends StatelessWidget {
  /// {@macro app_error}
  const AppError({
    this.error,
    super.key,
  });

  /// Error
  final Object? error;

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'App Error',
        theme: View.of(context).platformDispatcher.platformBrightness ==
                Brightness.dark
            ? ThemeData.dark(useMaterial3: true)
            : ThemeData.light(useMaterial3: true),
        home: Scaffold(
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Logo(),
                    const SizedBox(height: 32),
                    Text(
                      // ErrorUtil.formatMessage(error)
                      error?.toString() ?? 'Something went wrong',
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                      textScaler: TextScaler.noScaling,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling,
          ),
          child: child!,
        ),
      );
}
