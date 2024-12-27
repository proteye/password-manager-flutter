import 'dart:convert';

import 'package:password_manager/src/common/database/database.dart';
import 'package:password_manager/src/feature/credentials/data/provider/credentials_provider.dart';
import 'package:password_manager/src/feature/credentials/model/credential_model.dart';

/// {@macro credentials_provider}
/// Load and save credentials to database.
class DbCredentialsProvider implements CredentialsProvider {
  /// {@macro credentials_provider}
  DbCredentialsProvider({
    required Database database,
  }) : _database = database;

  /// Database instance.
  final Database _database;

  @override
  Future<List<Credential>> loadCredentials({
    String? search,
    int limit = 10,
    int offset = 0,
    String? orderBy = 'name',
    String? order = 'ASC',
  }) async {
    final credentialData = await (_database
            .select<CredentialTbl, CredentialTblData>(_database.credentialTbl)
          ..where((tbl) => tbl.jsonData.contains(search ?? '')))
        .get();

    return credentialData.map(
      (e) {
        final json = jsonDecode(e.jsonData) as Map<String, dynamic>;
        json['id'] = e.id;
        return Credential.fromJson(json);
      },
    ).toList();
  }

  @override
  Future<Credential?> loadCredential(int id) async {
    final credentialData = await (_database
            .select<CredentialTbl, CredentialTblData>(_database.credentialTbl)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();

    if (credentialData == null) {
      return null;
    }

    final json = jsonDecode(credentialData.jsonData) as Map<String, dynamic>;
    json['id'] = credentialData.id;

    return Credential.fromJson(json);
  }

  @override
  Future<Credential> saveCredential(Credential credential) async {
    await _database.into(_database.credentialTbl).insertOnConflictUpdate(
          CredentialTblCompanion.insert(
            id: Value(credential.id),
            jsonData: jsonEncode(credential.toJson()),
            version: const Value(Credential.version),
          ),
        );
    return Credential.empty();
  }
}
