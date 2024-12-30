part of 'credential_bloc.dart';

sealed class CredentialState extends Equatable {
  const CredentialState({
    this.credentials = const [],
    this.error,
  });

  final List<Credential> credentials;
  final Object? error;

  @override
  List<Object?> get props => [credentials, error];
}

final class CredentialState$Idle extends CredentialState {
  const CredentialState$Idle({
    super.credentials,
  });
}

final class CredentialState$Processing extends CredentialState {
  const CredentialState$Processing({
    super.credentials,
  });
}

final class CredentialState$Failure extends CredentialState {
  const CredentialState$Failure({
    super.credentials,
    super.error,
  });
}
