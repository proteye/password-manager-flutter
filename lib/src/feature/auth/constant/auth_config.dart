import 'package:password_manager/src/common/constant/pubspec.yaml.g.dart';

/// Auth config constants.
abstract final class AuthConfig {
  /// Key for User model.
  static const userKey = '${Pubspec.name}__user';

  /// Key for master password.
  static const masterPasswordKey = '${Pubspec.name}__master_password';

  /// Key for pin code.
  static const pinCodeKey = '${Pubspec.name}__pin_code';
}
