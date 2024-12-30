import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:octopus/octopus.dart';
import 'package:password_manager/src/common/localization/localization.dart';
import 'package:password_manager/src/common/util/launch_url.dart';
import 'package:password_manager/src/feature/auth/widget/auth_scope.dart';
import 'package:password_manager/src/feature/credentials/data/provider/db_credentials_provider.dart';
import 'package:password_manager/src/feature/credentials/data/reopsitory/credentials_repository.dart';
import 'package:password_manager/src/feature/credentials/data/reopsitory/credentials_result.dart';
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
  late bool _isEditMode = widget.credential == null;
  late Credential _credential;

  bool _passwordVisible = false;
  bool _inProgress = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _credential = widget.credential ?? Credential.empty();
  }

  void _toggleEditMode() {
    setState(() {
      _isEditMode = true;
    });
  }

  void _togglePasswordVisible() {
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

  void _cancel() {
    context.octopus.pop();
  }

  Future<void> _submit() async {
    _formKey.currentState?.save();
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    setState(() {
      _inProgress = true;
    });

    _credential
      ..abbr = _credential.generateAbbr()
      ..color = _credential.generateColor();
    final result =
        await context.read<CredentialsRepository>().saveCredential(_credential);

    if (result is CredentialsResult$Success) {
      _inProgress = false;
      _isEditMode = false;
    } else {
      _inProgress = false;
      _error = (result as CredentialsResult$Failure).error.toString();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: _credential.name.isNotEmpty
            ? Text(_credential.name)
            : Text(l10n.newCredential),
        actions: _isEditMode
            ? <Widget>[
                IconButton(
                  icon: const Icon(Icons.save),
                  onPressed: _submit,
                ),
              ]
            : null,
        leading: _isEditMode
            ? IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: _credential.id != null ? _toggleEditMode : _cancel,
              )
            : null,
      ),
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
                  decoration: InputDecoration(
                    labelText: l10n.resourceName,
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
                        decoration: InputDecoration(
                          labelText: l10n.resourceUrl,
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
                        icon: const Icon(
                          Icons.open_in_browser,
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
                        decoration: InputDecoration(
                          labelText: l10n.username,
                        ),
                        initialValue: _credential.username,
                        onSaved: (text) {
                          _credential.username = text ?? '';
                        },
                      ),
                    ),
                    if (!_isEditMode)
                      IconButton(
                        icon: const Icon(
                          Icons.content_copy,
                        ),
                        onPressed: () {
                          _copyToClipboard(_credential.username, l10n.username);
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
                          labelText: l10n.password,
                          suffixIcon: _isEditMode
                              ? IconButton(
                                  icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: _togglePasswordVisible,
                                )
                              : null,
                        ),
                        initialValue: _credential.password,
                        validator: (value) {
                          if ((value ?? '').isEmpty) {
                            return l10n.pleaseEnterPassword;
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
                        ),
                        onPressed: _togglePasswordVisible,
                      )
                    else
                      Container(),
                    if (!_isEditMode)
                      IconButton(
                        icon: const Icon(
                          Icons.content_copy,
                        ),
                        onPressed: () {
                          _copyToClipboard(_credential.password, l10n.password);
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
                  decoration: InputDecoration(
                    labelText: l10n.comment,
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
