import 'package:flutter/material.dart';
import 'package:password_manager/src/common/theme/theme.dart';

/// {@template logo}
/// Password Manager logo.
/// {@endtemplate}
class Logo extends StatelessWidget {
  /// {@macro logo}
  const Logo({super.key});

  @override
  Widget build(BuildContext context) => const Text(
        'Password Manager',
        style: PmTextStyle.displayMedium32B,
      );
}
