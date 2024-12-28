part of 'auth_bloc.dart';

/// {@template auth_event}
/// Authentication event.
/// {@endtemplate}
sealed class AuthEvent {
  const AuthEvent();
}

/// {@macro auth_event}
class AuthEvent$LoginByPassword extends AuthEvent {
  const AuthEvent$LoginByPassword({required this.password});

  /// Master password.
  final String password;
}

/// {@macro auth_event}
class AuthEvent$LoginByPinCode extends AuthEvent {
  const AuthEvent$LoginByPinCode({required this.code});

  /// Pin code.
  final String code;
}

/// {@macro auth_event}
class AuthEvent$LoginByFingerprint extends AuthEvent {
  const AuthEvent$LoginByFingerprint({required this.success});

  /// Fingerprint success.
  final bool success;
}
