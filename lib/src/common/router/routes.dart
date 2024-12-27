import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:password_manager/src/common/constant/config.dart';
import 'package:password_manager/src/feature/settings/settings.dart';

enum Routes with OctopusRoute {
  home('home', title: Config.appName),
  settings('settings', title: 'Settings');

  const Routes(this.name, {this.title});

  @override
  final String name;

  @override
  final String? title;

  @override
  Widget builder(BuildContext context, OctopusState state, OctopusNode node) =>
      switch (this) {
        Routes.home => const SettingsScreen(),
        Routes.settings => const SettingsScreen(),
      };
}
