import 'package:flutter/material.dart';
import 'package:password_manager/src/common/constant/config.dart';
import 'package:password_manager/src/common/localization/localization.dart';
import 'package:password_manager/src/common/theme/theme.dart';
import 'package:password_manager/src/common/widget/logo.dart';
import 'package:password_manager/src/feature/auth/model/sign_up_data.dart';
import 'package:password_manager/src/feature/auth/widget/auth_scope.dart';

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
  String _password = '';
  bool _inProgress = false;

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

  void _submit() {
    setState(() {
      _inProgress = true;
    });

    _formKey.currentState?.save();
    if (_formKey.currentState?.validate() ?? false) {
      AuthenticationScope.signUp(
        context,
        SignUpData(masterPassword: _password),
      );
      // context.octopus.push(Routes.signin);
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
                  l10n.registration,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: PmSpacing.xl4),
                TextFormField(
                  key: const ValueKey('password'),
                  autocorrect: false,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: l10n.newMasterPassword,
                    helperText: l10n.createAndRememberAMasterPassword,
                  ),
                  validator: (value) {
                    if ((value ?? '').isEmpty) {
                      return l10n.pleaseEnterMasterPassword;
                    }
                    if (value!.length < Config.passwordMinLength) {
                      return l10n.passwordMustBeAtLeast8CharactersLong;
                    }
                    return null;
                  },
                  onSaved: (text) {
                    _password = text ?? '';
                  },
                ),
                const SizedBox(height: PmSpacing.xl),
                TextFormField(
                  key: const ValueKey('confirmPassword'),
                  autocorrect: false,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: l10n.repeatMasterPassword,
                    helperText: l10n.repeatYourMasterPasswordAgain,
                  ),
                  validator: (value) {
                    if ((value ?? '').isEmpty) {
                      return l10n.pleaseRepeatMasterPassword;
                    }
                    if (value != _password) {
                      return l10n.thePasswordsDoNotMatch;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: PmSpacing.xl4),
                ElevatedButton(
                  key: const ValueKey('signup'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(PmSize.btnBig),
                    textStyle: Theme.of(context).textTheme.titleMedium,
                  ),
                  onPressed: _inProgress ? null : _submit,
                  child: Text(l10n.signUp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
