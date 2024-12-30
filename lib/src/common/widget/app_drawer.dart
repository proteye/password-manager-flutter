import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:password_manager/src/common/router/routes.dart';
import 'package:password_manager/src/common/widget/logo.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  static const List<Routes> _navItems = [
    Routes.home,
    Routes.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: _navItems.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const DrawerHeader(
              decoration: BoxDecoration(color: Colors.black87),
              child: Logo(),
            );
          }

          final item = _navItems[index - 1];
          final isLast = index == _navItems.length;
          return ListTile(
            title: Text(
              item.name,
              // style: TextStyle(color: isLast ? Colors.red : null),
            ),
            trailing: !isLast ? const Icon(Icons.arrow_right) : null,
            // leading: Icon(item['icon'], color: isLast ? Colors.red : null),
            onTap: () {
              context.octopus.push(item);
            },
          );
        },
      ),
    );
  }
}
