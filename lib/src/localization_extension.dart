import 'package:flutter/material.dart';
import 'package:flutter_extensionz/flutter_extensionz.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  FlutterExtensionzLocalizations get _l10n =>
      FlutterExtensionzLocalizations.of(this);

  ///
  /// Get localized currency symbol
  ///
  String get currencySymbol {
    final NumberFormat format =
        NumberFormat.simpleCurrency(locale: _l10n.localeName);
    return format.currencySymbol;
  }

  ///
  /// Get localized date
  ///
  String formatDate(DateTime? value, [String format = 'MM/dd/yyyy']) {
    if (value == null) {
      return '';
    }

    final DateFormat dateFormat = DateFormat(format, _l10n.localeName);
    return dateFormat.format(value);
  }

  ///
  /// Get localized number
  ///
  String formatNumber(num? value) {
    if (value == null) {
      return '';
    }

    final NumberFormat numberFormat =
        NumberFormat.decimalPattern(_l10n.localeName);
    return numberFormat.format(value);
  }

  ///
  /// Get localized percent
  ///
  String formatPercent(num? value) {
    if (value == null) {
      return '';
    }

    final NumberFormat numberFormat =
        NumberFormat.percentPattern(_l10n.localeName);
    return numberFormat.format(value);
  }
}
