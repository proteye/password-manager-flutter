part of 'auth_repository.dart';

/// {@template auth_repository_result}
/// Auth repository result.
/// {@endtemplate}
sealed class AuthRepositoryResult {}

/// {@macro auth_repository_result}
class AuthRepositoryResult$Success extends AuthRepositoryResult {
  AuthRepositoryResult$Success({
    required this.user,
  });

  /// Current user.
  final User user;
}

/// {@macro auth_repository_result}
class AuthRepositoryResult$Failure extends AuthRepositoryResult {
  AuthRepositoryResult$Failure({
    this.error,
    this.stackTrace,
  });

  /// Error.
  final Object? error;

  /// Stack trace.
  final StackTrace? stackTrace;
}
