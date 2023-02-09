part of '../flutter_extensionz.dart';

extension LocalizationExtension on BuildContext {
  FlutterExtensionzLocalizations get flutterExtensionzLocalizations =>
      FlutterExtensionzLocalizations.of(this);

  ///
  /// Get localized currency symbol
  ///
  String get currencySymbol {
    final NumberFormat format = NumberFormat.simpleCurrency(
      locale: flutterExtensionzLocalizations.localeName,
    );
    return format.currencySymbol;
  }

  ///
  /// Get localized date
  ///
  String formatDate(DateTime? value, [String format = 'MM/dd/yyyy']) {
    if (value == null) {
      return '';
    }

    final DateFormat dateFormat = DateFormat(
      format,
      flutterExtensionzLocalizations.localeName,
    );
    return dateFormat.format(value);
  }

  ///
  /// Get localized number
  ///
  String formatNumber(num? value) {
    if (value == null) {
      return '';
    }

    final NumberFormat numberFormat = NumberFormat.decimalPattern(
      flutterExtensionzLocalizations.localeName,
    );
    return numberFormat.format(value);
  }

  ///
  /// Get localized percent
  ///
  String formatPercent(num? value) {
    if (value == null) {
      return '';
    }

    final NumberFormat numberFormat = NumberFormat.percentPattern(
      flutterExtensionzLocalizations.localeName,
    );
    return numberFormat.format(value);
  }
}
