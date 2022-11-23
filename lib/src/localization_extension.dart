import 'package:flutter/material.dart';
import 'package:flutter_extensions/l10n/generated/flutter_extension_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;

  FlutterExtensionLocalizations get _l10n =>
      FlutterExtensionLocalizations.of(this)!;

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
  String formatDate(DateTime? value) {
    if (value == null) {
      return '';
    }

    // DateFormat.MEd(_l10n.localeName).format(value);
    final DateFormat dateFormat = DateFormat('MM/dd/yyyy', _l10n.localeName);
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
