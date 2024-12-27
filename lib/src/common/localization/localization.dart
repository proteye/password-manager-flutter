import 'package:flutter/widgets.dart';
import 'package:password_manager/src/common/localization/generated/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
