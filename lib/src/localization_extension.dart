part of flutter_extensionz;

// TODO: you dont need build context here
// think about moving this elsewhere
// maybe even into dart_extensionz, cause
// 'Intl' package is written in pure dart...

extension LocalizationExtension on BuildContext {
  /// Get localized currency symbol.
  ///
  /// This uses `Intl.NumberFormat.simpleCurrency`.
  String get currencySymbol {
    final NumberFormat format = NumberFormat.simpleCurrency(
      locale: Platform.localeName,
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
      locale: Platform.localeName,
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
      Platform.localeName,
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
      Platform.localeName,
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
      Platform.localeName,
    );
    return numberFormat.format(value);
  }
}
