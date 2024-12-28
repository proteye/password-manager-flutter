import 'dart:async';

import 'package:l/l.dart';
import 'package:password_manager/src/feature/credentials/data/provider/credentials_provider.dart';
import 'package:password_manager/src/feature/credentials/data/reopsitory/credentials_result.dart';
import 'package:password_manager/src/feature/credentials/model/credential.dart';

/// {@template credentials_repository}
/// Credentials repository of application.
/// {@endtemplate}
abstract class CredentialsRepository {
  /// {@macro credentials_repository}
  factory CredentialsRepository.createInstance({
    required CredentialsProvider provider,
  }) =>
      CredentialsRepositoryImpl(
        provider: provider,
      );

  /// Load all credentials.
  Future<CredentialsResult> loadCredentials({
    String? search,
    int limit = 10,
    int offset = 0,
    String? orderBy = 'name',
    String? order = 'ASC',
  });

  /// Load credential by id.
  Future<CredentialsResult> loadCredential(int id);

  /// Save or update credential.
  Future<CredentialsResult> saveCredential(Credential credential);
}

/// {@macro credentials_repository}
class CredentialsRepositoryImpl implements CredentialsRepository {
  /// {@macro credentials_repository}
  CredentialsRepositoryImpl({
    required CredentialsProvider provider,
  }) : _provider = provider;

  /// {@macro credentials_provider}
  final CredentialsProvider _provider;

  @override
  Future<CredentialsResult> loadCredentials({
    String? search,
    int limit = 10,
    int offset = 0,
    String? orderBy = 'name',
    String? order = 'ASC',
  }) async {
    try {
      final credentials = await _provider.loadCredentials(
        search: search,
        limit: limit,
        offset: offset,
        orderBy: orderBy,
        order: order,
      );
      return CredentialsResult$Success(credentials: credentials);
    } catch (e, st) {
      l.e(e, st);
      return CredentialsResult$Failure(error: e, stackTrace: st);
    }
  }

  @override
  Future<CredentialsResult> loadCredential(int id) async {
    try {
      final credential = await _provider.loadCredential(id);
      return CredentialsResult$Success(
        credentials: credential == null ? [] : [credential],
      );
    } catch (e, st) {
      l.e(e, st);
      return CredentialsResult$Failure(error: e, stackTrace: st);
    }
  }

  @override
  Future<CredentialsResult> saveCredential(Credential credential) async {
    try {
      final updatedCredential = await _provider.saveCredential(credential);
      return CredentialsResult$Success(credentials: [updatedCredential]);
    } catch (e, st) {
      l.e(e, st);
      return CredentialsResult$Failure(error: e, stackTrace: st);
    }
  }
}
