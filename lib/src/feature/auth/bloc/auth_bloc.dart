import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState$Idle()) {
    on<AuthEvent>(
      (event, emit) => switch (event) {
        AuthEvent$LoginByPassword() => _loadByPassword(event, emit),
        AuthEvent$LoginByPinCode() => _loginByPinCode(event, emit),
        AuthEvent$LoginByFingerprint() => _loginByFingerprint(event, emit),
      },
    );
  }

  _loadByPassword(
      AuthEvent$LoginByPassword event, Emitter<AuthState> emit) async {
    emit(const AuthState$Processing());
    emit(const AuthState$Idle());
  }

  _loginByPinCode(AuthEvent$LoginByPinCode event, Emitter<AuthState> emit) {
    emit(const AuthState$Processing());
  }

  _loginByFingerprint(
    AuthEvent$LoginByFingerprint event,
    Emitter<AuthState> emit,
  ) {
    emit(const AuthState$Processing());
  }
}
