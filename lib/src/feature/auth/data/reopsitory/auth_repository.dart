import 'dart:async';

import 'package:l/l.dart';
import 'package:password_manager/src/common/constant/config.dart';
import 'package:password_manager/src/common/database/secure_database.dart';
import 'package:password_manager/src/feature/auth/data/provider/auth_provider.dart';
import 'package:password_manager/src/feature/auth/model/sign_in_data.dart';
import 'package:password_manager/src/feature/auth/model/sign_up_data.dart';
import 'package:password_manager/src/feature/auth/model/user.dart';

part 'auth_repository_result.dart';

/// {@template auth_repository}
/// Auth repository of application.
/// {@endtemplate}
abstract class AuthRepository {
  /// {@macro auth_repository}
  factory AuthRepository.createInstance({
    required AuthProvider provider,
  }) =>
      AuthRepositoryImpl(
        provider: provider,
      );

  /// Stream of user changes.
  Stream<User> userChanges();

  /// Get current user.
  FutureOr<User> getUser();

  /// Restore user from current provider.
  Future<AuthRepositoryResult> restoreUser();

  /// Update user to current provider.
  Future<AuthRepositoryResult> updateUser(User user);

  /// Clear user from current provider.
  Future<AuthRepositoryResult> clearUser();

  /// Sign in to application.
  Future<AuthRepositoryResult> signIn(SignInData data);

  /// Sign up to application.
  Future<AuthRepositoryResult> signUp(SignUpData data);

  /// Sign out from application.
  Future<AuthRepositoryResult> signOut();
}

/// {@macro auth_repository}
class AuthRepositoryImpl implements AuthRepository {
  /// {@macro auth_repository}
  AuthRepositoryImpl({
    required AuthProvider provider,
  }) : _provider = provider;

  /// {@macro auth_provider}
  final AuthProvider _provider;

  final StreamController<User> _userController =
      StreamController<User>.broadcast();

  User _user = const User.unauthenticated(isRegistered: false);

  @override
  FutureOr<User> getUser() => _user;

  @override
  Stream<User> userChanges() => _userController.stream;

  @override
  Future<AuthRepositoryResult> restoreUser() async {
    try {
      var user = await _provider.restoreUser() ??
          const User.unauthenticated(isRegistered: false);
      if (user.isAuthenticated) {
        // await SecureDatabase.decryptDb(password: user.masterPassword);
        user = const User.unauthenticated(isRegistered: true);
      }
      _userController.add(_user = user);
      return AuthRepositoryResult$Success(
        user: user,
      );
    } catch (e, st) {
      l.e(e, st);
      await _provider.clearUser();
      return AuthRepositoryResult$Failure(
        error: e,
        stackTrace: st,
      );
    }
  }

  @override
  Future<AuthRepositoryResult> updateUser(User user) async {
    try {
      await _provider.updateUser(user);
      _userController.add(_user = user);
      return AuthRepositoryResult$Success(
        user: user,
      );
    } catch (e, st) {
      l.e(e, st);
      return AuthRepositoryResult$Failure(
        error: e,
        stackTrace: st,
      );
    }
  }

  @override
  Future<AuthRepositoryResult> clearUser() async {
    try {
      // Clear user from secure storage.
      await _provider.clearUser();
      // Remove database file.
      await SecureDatabase.removeDb();
      const user = User.unauthenticated(isRegistered: false);
      _userController.add(_user = user);
      return AuthRepositoryResult$Success(
        user: user,
      );
    } catch (e, st) {
      l.e(e, st);
      return AuthRepositoryResult$Failure(
        error: e,
        stackTrace: st,
      );
    }
  }

  @override
  Future<AuthRepositoryResult> signIn(SignInData data) async {
    try {
      final user = await _provider.restoreUser();
      if (user == null) {
        throw Exception('User not found');
      }
      if (data.pinCode != null && data.pinCode != user.pinCode) {
        throw Exception('Invalid pin code');
      }
      if (data.masterPassword != null &&
          data.masterPassword != user.masterPassword) {
        throw Exception('Invalid master password');
      }

      // Decrypt database by master-password.
      await SecureDatabase.decryptDb(password: user.masterPassword);

      _userController.add(_user = user);

      return AuthRepositoryResult$Success(user: user);
    } catch (e, st) {
      l.e(e, st);
      return AuthRepositoryResult$Failure(
        error: 'Invalid credentials',
        stackTrace: st,
      );
    }
  }

  @override
  Future<AuthRepositoryResult> signUp(SignUpData data) async {
    try {
      // Create secure database.
      final secureDatabase = Config.inMemoryDatabase
          ? SecureDatabase.memory()
          : SecureDatabase.lazy();
      await secureDatabase.refresh();
      await secureDatabase.close();
      // Encrypt database by master-password.
      await SecureDatabase.encryptDb(password: data.masterPassword);

      final user = User.authenticated(
        id: Config.defaultUserId,
        masterPassword: data.masterPassword,
      );
      await _provider.updateUser(user);
      _userController.add(_user = user);

      return AuthRepositoryResult$Success(user: user);
    } catch (e, st) {
      l.e(e, st);
      return AuthRepositoryResult$Failure(
        error: 'Database creating or encryption error',
        stackTrace: st,
      );
    }
  }

  @override
  Future<AuthRepositoryResult> signOut() => Future<AuthRepositoryResult>.sync(
        () {
          const user = User.unauthenticated(isRegistered: true);
          _userController.add(_user = user);
          return AuthRepositoryResult$Success(user: user);
        },
      );
}
