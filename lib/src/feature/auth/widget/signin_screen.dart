import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/// {@template signin_screen}
/// SigninScreen widget.
/// {@endtemplate}
class SigninScreen extends StatefulWidget {
  /// {@macro signin_screen}
  const SigninScreen({
    super.key, // ignore: unused_element
  });

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  @internal
  static _SigninScreenState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<_SigninScreenState>();

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

/// State for widget SigninScreen.
class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();

  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
  }

  @override
  void didUpdateWidget(covariant SigninScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Widget configuration changed
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // The configuration of InheritedWidgets has changed
    // Also called after initState but before build
  }

  @override
  void dispose() {
    // Permanent removal of a tree stent
    super.dispose();
  }
  /* #endregion */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Sign in',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 32),
                TextFormField(
                  key: const ValueKey('password'),
                  autocorrect: false,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Master password',
                    helperText: 'Enter your master password to sign in',
                  ),
                  validator: (value) {
                    if ((value ?? '').isEmpty) {
                      return 'Please enter master password';
                    }
                    // if (_error) {
                    //   return 'Password is invalid';
                    // }
                    return null;
                  },
                  onSaved: (text) {
                    // _password = text;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
