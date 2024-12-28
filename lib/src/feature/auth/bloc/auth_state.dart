part of 'auth_bloc.dart';

/// {@template auth_state}
/// Authentication state.
/// {@endtemplate}
sealed class AuthState extends Equatable {
  const AuthState({
    this.masterPassword = '',
    this.error,
  });

  /// The current master password.
  final String masterPassword;

  /// The current error.
  final Object? error;

  @override
  List<Object?> get props => [masterPassword, error];
}

/// {@macro auth_state}
final class AuthState$Idle extends AuthState {
  const AuthState$Idle({
    super.masterPassword,
  });
}

/// {@macro auth_state}
final class AuthState$Processing extends AuthState {
  const AuthState$Processing({
    super.masterPassword,
  });
}

/// {@macro auth_state}
final class AuthState$Failure extends AuthState {
  const AuthState$Failure({
    super.masterPassword,
    super.error,
  });
}
