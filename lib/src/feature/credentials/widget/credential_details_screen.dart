import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_manager/src/common/util/launch_url.dart';
import 'package:password_manager/src/common/widget/app_drawer.dart';
import 'package:password_manager/src/feature/auth/widget/auth_scope.dart';
import 'package:password_manager/src/feature/credentials/data/provider/db_credentials_provider.dart';
import 'package:password_manager/src/feature/credentials/data/reopsitory/credentials_repository.dart';
import 'package:password_manager/src/feature/credentials/model/credential.dart';

/// {@template credential_details_screen}
/// CredentialDetailsScreen widget.
/// {@endtemplate}
class CredentialDetailsScreen extends StatelessWidget {
  /// {@macro credential_details_screen}
  const CredentialDetailsScreen({
    this.credential,
    super.key, // ignore: unused_element
  });

  /// Credential to edit.
  final Credential? credential;

  @override
  Widget build(BuildContext context) => RepositoryProvider(
        create: (_) => CredentialsRepository.createInstance(
          provider: DbCredentialsProvider(
            database: AuthenticationScope.secureDatabaseOf(context)!,
          ),
        ),
        child: _CredentialDetails(credential: credential),
      );
}

class _CredentialDetails extends StatefulWidget {
  const _CredentialDetails({
    this.credential,
    super.key, // ignore: unused_element
  });

  /// Credential to edit.
  final Credential? credential;

  @override
  State<_CredentialDetails> createState() => _CredentialDetailsState();
}

/// State for widget CredentialDetailsScreen.
class _CredentialDetailsState extends State<_CredentialDetails> {
  final _formKey = GlobalKey<FormState>();
  late final bool _isEditMode = widget.credential == null;
  late Credential _credential;

  bool _passwordVisible = false;

  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
    _credential = widget.credential ?? Credential.empty();
  }

  @override
  void didUpdateWidget(covariant _CredentialDetails oldWidget) {
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

  _togglePasswordVisible() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  void _copyToClipboard(String value, String field) {
    Clipboard.setData(ClipboardData(text: value));
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('$field copied to clipboard')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  key: const Key('name'),
                  autocorrect: false,
                  autofocus: _isEditMode,
                  enabled: _isEditMode,
                  // focusNode: _nameFocusNode,
                  decoration: const InputDecoration(
                    labelText: 'Service name',
                  ),
                  initialValue: _credential.name,
                  validator: (value) {
                    // if ((value ?? '').isEmpty) {
                    //   return 'Please enter the name';
                    // }
                    return null;
                  },
                  onSaved: (text) {
                    _credential.name = text ?? '';
                  },
                ),
                const SizedBox(height: 15),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        key: const Key('url'),
                        autocorrect: false,
                        enabled: _isEditMode,
                        keyboardType: TextInputType.url,
                        decoration: const InputDecoration(
                          labelText: 'Service URL',
                        ),
                        initialValue: _credential.url,
                        validator: (value) {
                          // if (value.isEmpty && _credential.name.isEmpty) {
                          //   return 'Please enter url';
                          // }
                          return null;
                        },
                        onSaved: (text) {
                          _credential.url = text ?? '';
                        },
                      ),
                    ),
                    if (!_isEditMode)
                      IconButton(
                        icon: Icon(
                          Icons.open_in_browser,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          launchUrl(_credential.url);
                        },
                      )
                    else
                      Container(),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        key: const Key('username'),
                        autocorrect: false,
                        enabled: _isEditMode,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                        ),
                        initialValue: _credential.username,
                        onSaved: (text) {
                          _credential.username = text ?? '';
                        },
                      ),
                    ),
                    if (!_isEditMode)
                      IconButton(
                        icon: Icon(
                          Icons.content_copy,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          _copyToClipboard(_credential.username, 'Username');
                        },
                      )
                    else
                      Container(),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        key: const Key('password'),
                        autocorrect: false,
                        obscureText: !_passwordVisible,
                        enabled: _isEditMode,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: _isEditMode
                              ? IconButton(
                                  icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: _togglePasswordVisible,
                                )
                              : null,
                        ),
                        initialValue: _credential.password,
                        validator: (value) {
                          if ((value ?? '').isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        onSaved: (text) {
                          _credential.password = text ?? '';
                        },
                      ),
                    ),
                    if (!_isEditMode)
                      IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: _togglePasswordVisible,
                      )
                    else
                      Container(),
                    if (!_isEditMode)
                      IconButton(
                        icon: Icon(
                          Icons.content_copy,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          _copyToClipboard(_credential.password, 'Password');
                        },
                      )
                    else
                      Container(),
                  ],
                ),
                const SizedBox(height: 15),
                TextFormField(
                  key: const Key('comment'),
                  enabled: _isEditMode,
                  decoration: const InputDecoration(
                    labelText: 'Comment',
                  ),
                  initialValue: _credential.comment,
                  onSaved: (text) {
                    _credential.comment = text ?? '';
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
