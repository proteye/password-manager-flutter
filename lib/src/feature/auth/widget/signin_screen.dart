import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:password_manager/src/common/localization/localization.dart';
import 'package:password_manager/src/common/router/routes.dart';
import 'package:password_manager/src/common/theme/theme.dart';
import 'package:password_manager/src/common/widget/logo.dart';

/// {@template signin_screen}
/// Signin screen widget.
/// {@endtemplate}
class SigninScreen extends StatefulWidget {
  /// {@macro signin_screen}
  const SigninScreen({
    super.key, // ignore: unused_element
  });

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

/// State for widget SigninScreen.
class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();
  String _password = '';
  bool _inProgress = false;

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

  void _submit() {
    setState(() {
      _inProgress = true;
    });

    _formKey.currentState?.save();
    if (_formKey.currentState?.validate() ?? false) {
      context.octopus.push(Routes.signup);
    }

    setState(() {
      _inProgress = false;
    });
  }

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
                const Logo(),
                const SizedBox(height: PmSpacing.xl4),
                Text(
                  l10n.authorization,
                  style: Theme.of(context).textTheme.displaySmall,
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
                    _password = text ?? '';
                  },
                ),
                const SizedBox(height: PmSpacing.xl4),
                ElevatedButton(
                  key: const ValueKey('signin'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(PmSize.btnBig),
                    textStyle: Theme.of(context).textTheme.titleMedium,
                  ),
                  onPressed: _inProgress ? null : _submit,
                  child: Text(l10n.signIn),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
