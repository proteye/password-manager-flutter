import 'package:flutter/material.dart';

/// {@template sign_up_data}
/// Sign up data.
/// {@endtemplate}
@immutable
final class SignUpData {
  const SignUpData({
    this.masterPassword,
  });

  /// Master password.
  final String? masterPassword;
}
