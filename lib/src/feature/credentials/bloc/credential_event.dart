part of 'credential_bloc.dart';

sealed class CredentialEvent extends Equatable {
  const CredentialEvent();

  @override
  List<Object> get props => [];
}

class CredentialEvent$Load extends CredentialEvent {
  const CredentialEvent$Load();
}

class CredentialEvent$Update extends CredentialEvent {
  const CredentialEvent$Update(this.credential);
  final Credential credential;
}

class CredentialEvent$Delete extends CredentialEvent {
  const CredentialEvent$Delete(this.id);
  final int id;
}
