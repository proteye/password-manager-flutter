import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get areYouSureYouWantToDeleteYourAccount => 'Вы действительно хотите удалить Ваш аккаунт?';

  @override
  String get authorization => 'Авторизация';

  @override
  String get cancel => 'Отмена';

  @override
  String get comment => 'Комментарий';

  @override
  String get createAndRememberAMasterPassword => 'Придумайте и запомните мастер-пароль';

  @override
  String get createNewCredential => 'Создать новую запись';

  @override
  String get credentials => 'Учетные записи';

  @override
  String get delete => 'Удалить';

  @override
  String get deleteAccount => 'Удалить аккаунт';

  @override
  String get enterYourMasterPasswordToSignIn => 'Введите Ваш мастер-пароль для входа';

  @override
  String get exit => 'Выйти';

  @override
  String get masterPassword => 'Мастер-пароль';

  @override
  String nMatches(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString совпадений',
      few: '$countString совпадения',
      one: '1 совпадение',
      zero: '0 совпадений',
    );
    return '$_temp0';
  }

  @override
  String get newCredential => 'Новая запись';

  @override
  String get newMasterPassword => 'Новый мастер-пароль';

  @override
  String get password => 'Пароль';

  @override
  String get passwordIsInvalid => 'Неверный пароль';

  @override
  String get passwordMustBeAtLeast8CharactersLong => 'Пароль должен содержать не менее 8 символов';

  @override
  String get pleaseEnterMasterPassword => 'Введите мастер-пароль';

  @override
  String get pleaseEnterPassword => 'Пожалуйста, введите пароль';

  @override
  String get pleaseRepeatMasterPassword => 'Повторите мастер-пароль';

  @override
  String get registration => 'Регистрация';

  @override
  String get repeatMasterPassword => 'Повторите мастер-пароль';

  @override
  String get repeatYourMasterPasswordAgain => 'Повторите Ваш мастер-пароль еще раз';

  @override
  String get resourceName => 'Название ресурса';

  @override
  String get resourceUrl => 'URL ресурса';

  @override
  String get signIn => 'Войти';

  @override
  String get signUp => 'Зарегистрироваться';

  @override
  String get thePasswordsDoNotMatch => 'Пароли не совпадают';

  @override
  String get username => 'Имя пользователя';

  @override
  String get whenDeletingYouWillLoseAllSavedPasswordsAssociatedWithTheAccount => 'При удалении Вы потеряете все сохраненные пароли связанные с этим аккаунтом.';
}
