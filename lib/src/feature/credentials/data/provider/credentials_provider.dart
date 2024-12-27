import 'package:password_manager/src/feature/credentials/model/credential_model.dart';

/// {@template credentials_provider}
/// Credentials provider for repository.
/// {@endtemplate}
abstract class CredentialsProvider {
  /// Load all credentials.
  Future<List<Credential>> loadCredentials({
    String? search,
    int limit = 10,
    int offset = 0,
    String? orderBy = 'name',
    String? order = 'ASC',
  });

  /// Load credential by id.
  Future<Credential?> loadCredential(int id);

  /// Save or update credential.
  Future<Credential> saveCredential(Credential credential);
}
