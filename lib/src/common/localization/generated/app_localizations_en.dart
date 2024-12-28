import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get enterYourMasterPasswordToSignIn => 'Enter your master password to sign in';

  @override
  String get masterPassword => 'Master password';

  @override
  String nMatches(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString matches',
      one: '1 match',
      zero: '0 matches',
    );
    return '$_temp0';
  }

  @override
  String get pleaseEnterMasterPassword => 'Please enter master password';

  @override
  String get signIn => 'Sign in';

  @override
  String get signUp => 'Sign up';
}
