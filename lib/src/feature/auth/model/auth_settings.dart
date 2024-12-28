/// {@template auth_settings}
/// Authentication settings.
/// {@endtemplate}
class AuthSettings {
  /// {@macro auth_settings}
  const AuthSettings({
    this.masterPassword = '',
  });

  AuthSettings.empty() : this(masterPassword: '');

  /// The master password to unlock the app and encrypt/decrypt data.
  final String masterPassword;

  @override
  String toString() {
    return '''AuthSettings(masterPassword: $masterPassword)''';
  }
}
