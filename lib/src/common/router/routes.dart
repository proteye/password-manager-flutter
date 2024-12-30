import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:password_manager/src/common/constant/config.dart';
import 'package:password_manager/src/feature/auth/widget/signin_screen.dart';
import 'package:password_manager/src/feature/auth/widget/signup_screen.dart';
import 'package:password_manager/src/feature/credentials/widget/credential_details_screen.dart';
import 'package:password_manager/src/feature/credentials/widget/credential_list_screen.dart';
import 'package:password_manager/src/feature/settings/settings.dart';

enum Routes with OctopusRoute {
  signin('signin', title: 'Sign in'),
  signup('signup', title: 'Sign up'),
  home('home', title: Config.appName),
  credentialDetails('credentialDetails', title: 'Credential details'),
  settings('settings', title: 'Settings');

  const Routes(this.name, {this.title});

  @override
  final String name;

  @override
  final String? title;

  @override
  Widget builder(BuildContext context, OctopusState state, OctopusNode node) =>
      switch (this) {
        Routes.signin => const SigninScreen(),
        Routes.signup => const SignupScreen(),
        Routes.home => const CredentialListScreen(),
        Routes.credentialDetails => const CredentialDetailsScreen(),
        Routes.settings => const SettingsScreen(),
      };
}
