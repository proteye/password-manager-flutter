import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:password_dart/password_dart.dart';
import 'package:password_manager/src/common/util/hex_util.dart';

/// Returns [encrypt.Key] by string [password].
encrypt.Key getKeyByPassword(String password) {
  final passHash = Password.hash(password, PBKDF2(desiredKeyLength: 32));
  final passBytes = createUint8ListFromHexString(passHash.split(r'$').last);
  return encrypt.Key(passBytes);
}
