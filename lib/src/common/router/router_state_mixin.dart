import 'package:flutter/widgets.dart'
    show DefaultTransitionDelegate, State, StatefulWidget, ValueNotifier;
import 'package:octopus/octopus.dart';
import 'package:password_manager/src/common/router/home_guard.dart';
import 'package:password_manager/src/common/router/routes.dart';

mixin RouterStateMixin<T extends StatefulWidget> on State<T> {
  late final Octopus router;
  late final ValueNotifier<List<({Object error, StackTrace stackTrace})>>
      errorsObserver;

  @override
  void initState() {
    // Observe all errors.
    errorsObserver =
        ValueNotifier<List<({Object error, StackTrace stackTrace})>>(
      <({Object error, StackTrace stackTrace})>[],
    );

    // Create router.
    router = Octopus(
      routes: Routes.values,
      defaultRoute: Routes.home,
      transitionDelegate: const DefaultTransitionDelegate<void>(),
      guards: <IOctopusGuard>[
        // Home route should be always on top.
        HomeGuard(),
      ],
      onError: (error, stackTrace) =>
          errorsObserver.value = <({Object error, StackTrace stackTrace})>[
        (error: error, stackTrace: stackTrace),
        ...errorsObserver.value,
      ],
    );
    super.initState();
  }
}
