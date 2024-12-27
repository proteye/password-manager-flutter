import 'package:flutter/material.dart';

/// {@template logo}
/// Bible Scripture logo image.
/// {@endtemplate}
class Logo extends StatelessWidget {
  /// {@macro logo}
  const Logo({
    this.scale = 2,
    super.key,
  });

  /// The scale of the image.
  final double scale;

  @override
  Widget build(BuildContext context) => Image.asset(
        'assets/images/logo.png',
        scale: scale,
      );
}
