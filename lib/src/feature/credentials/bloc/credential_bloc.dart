import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:password_manager/src/feature/credentials/data/reopsitory/credentials_repository.dart';
import 'package:password_manager/src/feature/credentials/data/reopsitory/credentials_result.dart';
import 'package:password_manager/src/feature/credentials/model/credential.dart';

part 'credential_event.dart';
part 'credential_state.dart';

class CredentialBloc extends Bloc<CredentialEvent, CredentialState> {
  CredentialBloc({required CredentialsRepository repository})
      : _repository = repository,
        super(const CredentialState$Processing()) {
    on<CredentialEvent>(
      (event, emit) => switch (event) {
        CredentialEvent$Load() => _loadCredentials(event, emit),
        CredentialEvent$Update() => _updateCredential(event, emit),
        CredentialEvent$Delete() => _deleteCredential(event, emit),
      },
    );
    _repository.credentials.addListener(_listener);
  }

  final CredentialsRepository _repository;

  @override
  Future<void> close() async {
    _repository.credentials.removeListener(_listener);
    return super.close();
  }

  void _listener() {
    if (isClosed) return;
    add(const CredentialEvent$Load());
  }

  Future<void> _loadCredentials(
    CredentialEvent$Load event,
    Emitter<CredentialState> emit,
  ) async {
    final result = await _repository.loadCredentials();
    if (result is CredentialsResult$Success) {
      emit(CredentialState$Idle(credentials: result.credentials));
    } else {
      emit(
        CredentialState$Failure(
          credentials: state.credentials,
          error: (result as CredentialsResult$Failure).error,
        ),
      );
    }
  }

  Future<void> _updateCredential(
    CredentialEvent$Update event,
    Emitter<CredentialState> emit,
  ) async {}

  Future<void> _deleteCredential(
    CredentialEvent$Delete event,
    Emitter<CredentialState> emit,
  ) async {}
}
