// ignore_for_file: avoid_dynamic_calls

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l/l.dart';

/// {@template app_bloc_observer}
/// AppBlocObserver
/// {@endtemplate}
class AppBlocObserver extends BlocObserver {
  /// {@macro app_bloc_observer}
  AppBlocObserver();

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    l.i('\x1B[32m${bloc.runtimeType}: ${transition.currentState.runtimeType} '
        '--> ${transition.nextState.runtimeType}');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    l.e(
      '⛔️ \x1B[33m${bloc.runtimeType}: Error ${bloc.runtimeType} $error',
      stackTrace,
    );
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    l.i('\x1B[32m${bloc.runtimeType}: onEvent: $event');
  }
}
