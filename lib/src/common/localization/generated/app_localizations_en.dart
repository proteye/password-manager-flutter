import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get areYouSureYouWantToDeleteYourAccount => 'Are you sure you want to delete your account?';

  @override
  String get authorization => 'Authorization';

  @override
  String get cancel => 'Отмена';

  @override
  String get createAndRememberAMasterPassword => 'Create and remember a master-password';

  @override
  String get delete => 'Удалить';

  @override
  String get deleteAccount => 'Delete account';

  @override
  String get enterYourMasterPasswordToSignIn => 'Enter your master-password to sign in';

  @override
  String get exit => 'Exit';

  @override
  String get masterPassword => 'Master-password';

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
  String get newMasterPassword => 'New master-password';

  @override
  String get passwordIsInvalid => 'Password is invalid';

  @override
  String get passwordMustBeAtLeast8CharactersLong => 'Password must be at least 8 characters long';

  @override
  String get pleaseEnterMasterPassword => 'Please enter master-password';

  @override
  String get pleaseRepeatMasterPassword => 'Please repeat master-password';

  @override
  String get registration => 'Registration';

  @override
  String get repeatMasterPassword => 'Repeat master-password';

  @override
  String get repeatYourMasterPasswordAgain => 'Repeat your master-password again';

  @override
  String get signIn => 'Sign in';

  @override
  String get signUp => 'Sign up';

  @override
  String get thePasswordsDoNotMatch => 'The passwords do not match';

  @override
  String get whenDeletingYouWillLoseAllSavedPasswordsAssociatedWithTheAccount => 'When deleting, you will lose all saved passwords associated with the account.';
}
