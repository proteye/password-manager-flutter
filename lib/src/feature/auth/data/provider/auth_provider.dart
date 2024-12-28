import 'package:password_manager/src/feature/auth/model/user.dart';

/// {@template auth_provider}
/// Authentication provider for repository.
/// {@endtemplate}
abstract class AuthProvider {
  /// Restore user from current provider.
  Future<User?> restoreUser();

  /// Update user to current provider.
  Future<void> updateUser(User user);
}
