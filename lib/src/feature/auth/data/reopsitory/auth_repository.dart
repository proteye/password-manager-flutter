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

  /// Load pin code from current provider.
  Future<AuthRepositoryResult> restoreUser();

  /// Save pin code to current provider.
  Future<AuthRepositoryResult> updateUser(User user);

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
      final user = await _provider.restoreUser() ??
          const User.unauthenticated(isRegistered: false);
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
  Future<AuthRepositoryResult> signIn(SignInData data) async {
    if (data.masterPassword != null) {
      return AuthRepositoryResult$Success(user: _user);
    } else if (data.pinCode != null && data.pinCode == _user.pinCode) {
      return AuthRepositoryResult$Success(user: _user);
    }
    return AuthRepositoryResult$Failure(error: 'Invalid credentials');
  }

  @override
  Future<AuthRepositoryResult> signUp(SignUpData data) async {
    if (data.masterPassword != null) {
      final secureDatabase = Config.inMemoryDatabase
          ? SecureDatabase.memory()
          : SecureDatabase.lazy();
      await secureDatabase.refresh();
      await secureDatabase.close();
      final user = User.authenticated(
        id: Config.defaultUserId,
        masterPassword: data.masterPassword!,
      );
      _userController.add(_user = user);
      return AuthRepositoryResult$Success(user: user);
    }
    return AuthRepositoryResult$Failure(error: 'Invalid credentials');
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
