/// {@template auth_provider}
/// Authentication provider for repository.
/// {@endtemplate}
abstract class AuthProvider {
  /// Load pin code from current provider.
  Future<String?> loadPinCode();

  /// Save pin code to current provider.
  Future<void> savePinCode(String pinCode);

  /// Load master password from current provider.
  Future<String?> loadMasterPassword();

  /// Save master password to current provider.
  Future<void> saveMasterPassword(String password);
}
