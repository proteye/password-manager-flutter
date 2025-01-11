import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
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

  /// List of actual credentials.
  ValueNotifier<List<Credential>> get credentials;

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

  /// Create or update credential.
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

  final ValueNotifier<List<Credential>> _credentialsNotifier =
      ValueNotifier([]);

  List<Credential> get _credentials => _credentialsNotifier.value;

  /// List of actual credentials.
  @override
  ValueNotifier<List<Credential>> get credentials => _credentialsNotifier;

  @override
  Future<CredentialsResult> loadCredentials({
    String? search,
    int limit = 10,
    int offset = 0,
    String? orderBy = 'name',
    String? order = 'ASC',
  }) async {
    try {
      if (_credentials.isEmpty) {
        _credentialsNotifier.value = (await _provider.loadCredentials(
          limit: 100000,
        ))
            .sortedBy((item) => item.name);
      }
      return CredentialsResult$Success(
        credentials: _credentials
            .where(
              (item) =>
                  item.name.contains(search ?? '') ||
                  item.url.contains(search ?? '') ||
                  item.username.contains(search ?? '') ||
                  item.comment.contains(search ?? ''),
            )
            .toList(),
      );
    } catch (e, st) {
      l.e(e, st);
      return CredentialsResult$Failure(error: e, stackTrace: st);
    }
  }

  @override
  Future<CredentialsResult> loadCredential(int id) async {
    try {
      if (_credentials.isNotEmpty) {
        final credential =
            _credentials.firstWhereOrNull((item) => item.id == id);
        return CredentialsResult$Success(
          credentials: credential == null ? [] : [credential],
        );
      }
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
      credential
        ..abbr = credential.generateAbbr()
        ..color = credential.color.isNotEmpty
            ? credential.color
            : credential.generateColor();
      final updatedCredential = await _provider.saveCredential(credential);
      // Update local credentials list.
      if (credential.id == null) {
        _credentialsNotifier.value =
            [..._credentials, updatedCredential].sortedBy((item) => item.name);
      } else {
        _credentialsNotifier.value = _credentials.map((item) {
          if (item.id == credential.id) {
            return updatedCredential;
          }
          return item;
        }).sortedBy((item) => item.name);
      }
      return CredentialsResult$Success(credentials: [updatedCredential]);
    } catch (e, st) {
      l.e(e, st);
      return CredentialsResult$Failure(error: e, stackTrace: st);
    }
  }
}
