import 'package:password_manager/src/feature/auth/constant/auth_config.dart';
import 'package:password_manager/src/feature/auth/data/provider/auth_provider.dart';
import 'package:secure_storage/secure_storage.dart';

/// {@macro auth_provider}
/// Load and save auth settings to the secure storage.
class SecureAuthProvider implements AuthProvider {
  /// {@macro auth_provider}
  SecureAuthProvider({
    required this.storage,
  });

  /// Secure storage provider.
  final SecureStorage storage;

  @override
  Future<String?> loadMasterPassword() {
    return storage.read(key: AuthConfig.masterPasswordKey);
  }

  @override
  Future<String?> loadPinCode() {
    return storage.read(key: AuthConfig.pinCodeKey);
  }

  @override
  Future<void> saveMasterPassword(String password) async {
    await storage.write(key: AuthConfig.masterPasswordKey, value: password);
  }

  @override
  Future<void> savePinCode(String pinCode) async {
    await storage.write(key: AuthConfig.pinCodeKey, value: pinCode);
  }
}
