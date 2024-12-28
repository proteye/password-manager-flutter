import 'dart:async';

import 'package:l/l.dart';
import 'package:password_manager/src/feature/auth/data/provider/auth_provider.dart';

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

  /// Current master password.
  String get masterPassword;

  /// Current pin code.
  String get pinCode;

  /// Load pin code from current provider.
  Future<AuthRepositoryResult> loadPinCode();

  /// Save pin code to current provider.
  Future<AuthRepositoryResult> savePinCode(String pinCode);

  /// Load master password from current provider.
  Future<AuthRepositoryResult> loadMasterPassword();

  /// Save master password to current provider.
  Future<AuthRepositoryResult> saveMasterPassword(String password);
}

/// {@macro auth_repository}
class AuthRepositoryImpl implements AuthRepository {
  /// {@macro auth_repository}
  AuthRepositoryImpl({
    required AuthProvider provider,
  }) : _provider = provider;

  /// {@macro auth_provider}
  final AuthProvider _provider;

  String _masterPassword = '';
  String _pinCode = '';

  @override
  String get masterPassword => _masterPassword;

  @override
  String get pinCode => _pinCode;

  @override
  Future<AuthRepositoryResult> loadMasterPassword() async {
    try {
      _masterPassword = await _provider.loadMasterPassword() ?? '';
      return AuthRepositoryResult$Success(
        masterPassword: _masterPassword,
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
  Future<AuthRepositoryResult> loadPinCode() async {
    try {
      _pinCode = await _provider.loadPinCode() ?? '';
      return AuthRepositoryResult$Success(
        pinCode: _pinCode,
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
  Future<AuthRepositoryResult> saveMasterPassword(String password) async {
    try {
      _masterPassword = password;
      await _provider.saveMasterPassword(password);
      return AuthRepositoryResult$Success(
        masterPassword: password,
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
  Future<AuthRepositoryResult> savePinCode(String code) async {
    try {
      _pinCode = code;
      await _provider.savePinCode(code);
      return AuthRepositoryResult$Success(
        pinCode: pinCode,
      );
    } catch (e, st) {
      l.e(e, st);
      return AuthRepositoryResult$Failure(
        error: e,
        stackTrace: st,
      );
    }
  }
}
