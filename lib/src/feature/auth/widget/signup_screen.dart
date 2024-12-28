import 'package:flutter/material.dart';
import 'package:password_manager/src/common/localization/localization.dart';
import 'package:password_manager/src/common/theme/theme.dart';

/// {@template signup_screen}
/// Signup screen widget.
/// {@endtemplate}
class SignupScreen extends StatefulWidget {
  /// {@macro signup_screen}
  const SignupScreen({
    super.key, // ignore: unused_element
  });

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

/// State for widget SignupScreen.
class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
  }

  @override
  void didUpdateWidget(covariant SignupScreen oldWidget) {
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
    final l10n = context.l10n;

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
                  l10n.signUp,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: PmSpacing.xl4),
                TextFormField(
                  key: const ValueKey('password'),
                  autocorrect: false,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: l10n.masterPassword,
                    helperText: l10n.enterYourMasterPasswordToSignIn,
                  ),
                  validator: (value) {
                    if ((value ?? '').isEmpty) {
                      return l10n.pleaseEnterMasterPassword;
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
                const SizedBox(height: PmSpacing.xl),
                TextFormField(
                  key: const ValueKey('confirmPassword'),
                  autocorrect: false,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: l10n.masterPassword,
                    helperText: l10n.enterYourMasterPasswordToSignIn,
                  ),
                  validator: (value) {
                    if ((value ?? '').isEmpty) {
                      return l10n.pleaseEnterMasterPassword;
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
