import 'package:password_manager/src/feature/credentials/model/credential_model.dart';

sealed class CredentialsResult {}

class CredentialsResult$Success extends CredentialsResult {
  CredentialsResult$Success({
    required this.credentials,
  });

  final List<Credential> credentials;
}

class CredentialsResult$Failure extends CredentialsResult {
  CredentialsResult$Failure({
    this.error,
    this.stackTrace,
  });

  final Object? error;
  final StackTrace? stackTrace;
}
