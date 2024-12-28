import 'package:flutter/material.dart';

/// {@template sign_in_data}
/// Sign in data.
/// {@endtemplate}
@immutable
final class SignInData {
  const SignInData({
    this.masterPassword,
    this.pinCode,
  });

  /// Master password.
  final String? masterPassword;

  /// Pin code.
  final String? pinCode;
}
