import 'dart:convert';

import 'package:password_manager/src/feature/auth/constant/auth_config.dart';
import 'package:password_manager/src/feature/auth/data/provider/auth_provider.dart';
import 'package:password_manager/src/feature/auth/model/user.dart';
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
  Future<User?> restoreUser() async {
    final json = await storage.read(key: AuthConfig.userKey);
    if (json == null) return null;
    return User.fromJson(jsonDecode(json) as Map<String, Object?>);
  }

  @override
  Future<void> updateUser(User user) async {
    await storage.write(
      key: AuthConfig.userKey,
      value: jsonEncode(user.toJson()),
    );
  }

  @override
  Future<void> clearUser() async {
    await storage.delete(key: AuthConfig.userKey);
  }
}
