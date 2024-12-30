import 'dart:async';

import 'package:control/control.dart';
import 'package:password_manager/src/common/database/secure_database.dart';
import 'package:password_manager/src/feature/auth/controller/auth_state.dart';
import 'package:password_manager/src/feature/auth/data/reopsitory/auth_repository.dart';
import 'package:password_manager/src/feature/auth/model/sign_in_data.dart';
import 'package:password_manager/src/feature/auth/model/sign_up_data.dart';
import 'package:password_manager/src/feature/auth/model/user.dart';

final class AuthController extends StateController<AuthenticationState>
    with DroppableControllerHandler {
  AuthController({
    required AuthRepository repository,
    super.initialState = const AuthenticationState.idle(
      user: User.unauthenticated(isRegistered: false),
    ),
  }) : _repository = repository {
    _userSubscription = repository
        .userChanges()
        .map<AuthenticationState>((u) => AuthenticationState.idle(user: u))
        .where(
          (newState) =>
              state.isProcessing || !identical(newState.user, state.user),
        )
        .listen(setState, cancelOnError: false);
  }

  final AuthRepository _repository;
  StreamSubscription<AuthenticationState>? _userSubscription;

  /// Auth repository of application.
  SecureDatabase? get secureDatabase => _repository.secureDatabase;

  /// Restore the session from the cache.
  void restore() => handle(
        () async {
          setState(
            AuthenticationState.processing(
              user: state.user,
              message: 'Restoring session...',
            ),
          );
          final result = await _repository.restoreUser();
          if (result is AuthRepositoryResult$Success) {
            setState(AuthenticationState.idle(user: result.user));
          } else {
            throw Exception();
          }
        },
        error: (error, _) async => setState(
          const AuthenticationState.idle(
            user: User.unauthenticated(isRegistered: false),
            error: 'Restore Error', // ErrorUtil.formatMessage(error)
          ),
        ),
      );

  /// Sign in with the given [data].
  void signIn(SignInData data) => handle(
        () async {
          setState(
            AuthenticationState.processing(
              user: state.user,
              message: 'Logging in...',
            ),
          );
          final result = await _repository.signIn(data);
          if (result is AuthRepositoryResult$Success) {
            setState(AuthenticationState.idle(user: result.user));
          } else {
            throw Exception();
          }
        },
        error: (error, _) async => setState(
          AuthenticationState.idle(
            user: state.user,
            error: 'Sign In Error',
          ),
        ),
      );

  /// Sign up with the given [data].
  void signUp(SignUpData data) => handle(
        () async {
          setState(
            AuthenticationState.processing(
              user: state.user,
              message: 'Signing up...',
            ),
          );
          final result = await _repository.signUp(data);
          if (result is AuthRepositoryResult$Success) {
            setState(AuthenticationState.idle(user: result.user));
          } else {
            throw Exception();
          }
        },
        error: (error, _) async => setState(
          AuthenticationState.idle(
            user: state.user,
            error: 'Sign Up Error',
          ),
        ),
      );

  /// Sign out.
  void signOut() => handle(
        () async {
          setState(
            AuthenticationState.processing(
              user: state.user,
              message: 'Logging out...',
            ),
          );
          final result = await _repository.signOut();
          if (result is AuthRepositoryResult$Success) {
            setState(AuthenticationState.idle(user: result.user));
          } else {
            throw Exception();
          }
        },
        error: (error, _) async => setState(
          AuthenticationState.idle(
            user: state.user,
            error: 'Sign Out Error',
          ),
        ),
      );

  /// Exit and delete current user.
  void clearUser() => handle(
        () async {
          setState(
            AuthenticationState.processing(
              user: state.user,
              message: 'Clearing user...',
            ),
          );
          final result = await _repository.clearUser();
          if (result is AuthRepositoryResult$Success) {
            setState(AuthenticationState.idle(user: result.user));
          } else {
            throw Exception();
          }
        },
        error: (error, _) async => setState(
          AuthenticationState.idle(
            user: state.user,
            error: 'Clear user Error',
          ),
        ),
        // done: () async => setState(
        //   const AuthenticationState.idle(
        //     user: User.unauthenticated(isRegistered: true),
        //   ),
        // ),
      );

  @override
  void dispose() {
    _userSubscription?.cancel();
    super.dispose();
  }
}
