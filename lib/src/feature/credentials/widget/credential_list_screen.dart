import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:octopus/octopus.dart';
import 'package:password_manager/src/common/localization/localization.dart';
import 'package:password_manager/src/common/router/routes.dart';
import 'package:password_manager/src/common/widget/app_drawer.dart';
import 'package:password_manager/src/feature/auth/widget/auth_scope.dart';
import 'package:password_manager/src/feature/credentials/data/provider/db_credentials_provider.dart';
import 'package:password_manager/src/feature/credentials/data/reopsitory/credentials_repository.dart';
import 'package:password_manager/src/feature/credentials/data/reopsitory/credentials_result.dart';
import 'package:password_manager/src/feature/credentials/model/credential.dart';

/// {@template credential_list_screen}
/// CredentialListScreen widget.
/// {@endtemplate}
class CredentialListScreen extends StatelessWidget {
  /// {@macro credential_list_screen}
  const CredentialListScreen({
    super.key, // ignore: unused_element
  });

  @override
  Widget build(BuildContext context) => RepositoryProvider(
        create: (_) => CredentialsRepository.createInstance(
          provider: DbCredentialsProvider(
            database: AuthenticationScope.secureDatabaseOf(context)!,
          ),
        ),
        child: const _CredentialList(),
      );
}

class _CredentialList extends StatefulWidget {
  const _CredentialList({
    super.key, // ignore: unused_element
  });

  @override
  State<_CredentialList> createState() => _CredentialListState();
}

/// State for widget CredentialListScreen.
class _CredentialListState extends State<_CredentialList> {
  late Future<List<Credential>> _credentialItems;
  late final Widget _appBarTitle = Text(context.l10n.credentials);
  final Icon _searchIcon = const Icon(Icons.search);

  @override
  void initState() {
    super.initState();
    // Initial state initialization
    _credentialItems =
        context.read<CredentialsRepository>().loadCredentials().then(
      (result) {
        if (result is CredentialsResult$Success) return result.credentials;
        throw Exception((result as CredentialsResult$Failure).error);
      },
    );
  }

  void _search() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _appBarTitle,
        actions: <Widget>[
          IconButton(
            icon: _searchIcon,
            onPressed: _search,
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder<List<Credential>>(
        future: _credentialItems,
        builder:
            (BuildContext context, AsyncSnapshot<List<Credential>> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error to load credentials'),
            );
          } else if (snapshot.hasData) {
            print('snapshot: ${snapshot.data!.length}');
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final credential = snapshot.data![index];
                return ListTile(
                  title: Text(
                    credential.name.isNotEmpty
                        ? credential.name
                        : credential.url,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(credential.comment),
                  leading: Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(int.parse(credential.color)),
                    ),
                    child: Text(
                      credential.abbr,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // _showDetails(item);
                  },
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.octopus.push(Routes.credentialDetails);
        },
        tooltip: context.l10n.createNewCredential,
        child: const Icon(Icons.add),
      ),
    );
  }
}
