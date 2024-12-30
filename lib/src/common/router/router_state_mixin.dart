import 'package:flutter/widgets.dart'
    show DefaultTransitionDelegate, State, StatefulWidget, ValueNotifier;
import 'package:octopus/octopus.dart';
import 'package:password_manager/src/common/model/dependencies.dart';
import 'package:password_manager/src/common/router/auth_guard.dart';
import 'package:password_manager/src/common/router/home_guard.dart';
import 'package:password_manager/src/common/router/routes.dart';

mixin RouterStateMixin<T extends StatefulWidget> on State<T> {
  late final Octopus router;
  late final ValueNotifier<List<({Object error, StackTrace stackTrace})>>
      errorsObserver;

  @override
  void initState() {
    final dependencies = Dependencies.of(context);
    // Observe all errors.
    errorsObserver =
        ValueNotifier<List<({Object error, StackTrace stackTrace})>>(
      <({Object error, StackTrace stackTrace})>[],
    );

    // Create router.
    router = Octopus(
      routes: Routes.values,
      defaultRoute: Routes.signin,
      transitionDelegate: const DefaultTransitionDelegate<void>(),
      guards: <IOctopusGuard>[
        // Check authentication.
        AuthenticationGuard(
          // Get current user from authentication controller.
          getUser: () => dependencies.authController.state.user,
          // Available routes for non authenticated user.
          routes: <String>{
            Routes.signin.name,
            Routes.signup.name,
          },
          // Default route for non authenticated user.
          signinNavigation: OctopusState.single(Routes.signin.node()),
          // Default route for non registered user.
          signupNavigation: OctopusState.single(Routes.signup.node()),
          // Default route for authenticated user.
          homeNavigation: OctopusState.single(Routes.home.node()),
          // Check authentication on every authentication controller
          // state change.
          refresh: dependencies.authController,
        ),
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
