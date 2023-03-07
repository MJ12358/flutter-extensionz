part of flutter_extensionz;

extension LocalizationExtension on BuildContext {
  FlutterExtensionzLocalizations get flutterExtensionzLocalizations =>
      FlutterExtensionzLocalizations.of(this);

  /// Get localized currency symbol.
  ///
  /// This uses `Intl.NumberFormat.simpleCurrency`.
  String get currencySymbol {
    final NumberFormat format = NumberFormat.simpleCurrency(
      locale: flutterExtensionzLocalizations.localeName,
    );
    return format.currencySymbol;
  }

  /// Get localized currency.
  ///
  /// This uses `Intl.NumberFormat.simpleCurrency`.
  String formatCurrency(Object? value) {
    if (value == null) {
      return '';
    }

    final NumberFormat numberFormat = NumberFormat.simpleCurrency(
      locale: flutterExtensionzLocalizations.localeName,
    );
    return numberFormat.format(value);
  }

  /// Get localized date.
  ///
  /// This uses `Intl.DateFormat`.
  String formatDate(
    DateTime? value, [
    String format = 'MM/dd/yyyy',
  ]) {
    if (value == null) {
      return '';
    }

    final DateFormat dateFormat = DateFormat(
      format,
      flutterExtensionzLocalizations.localeName,
    );
    return dateFormat.format(value);
  }

  /// Get localized number.
  ///
  /// This uses `Intl.NumberFormat.decimalPattern`.
  String formatNumber(Object? value) {
    if (value == null) {
      return '';
    }

    final NumberFormat numberFormat = NumberFormat.decimalPattern(
      flutterExtensionzLocalizations.localeName,
    );
    return numberFormat.format(value);
  }

  /// Get localized percent.
  ///
  /// This uses `Intl.NumberFormat.percentPattern`.
  String formatPercent(Object? value) {
    if (value == null) {
      return '';
    }

    final NumberFormat numberFormat = NumberFormat.percentPattern(
      flutterExtensionzLocalizations.localeName,
    );
    return numberFormat.format(value);
  }
}
