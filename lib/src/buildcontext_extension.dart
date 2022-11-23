import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extensions/l10n/generated/flutter_extension_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

extension BuildContextExtension on BuildContext {
  ///
  /// Wraps the [showDialog] method and builds an [AlertDialog]
  ///
  Future<bool> showAlertDialog(
    Widget content, {
    String? title,
    String? cancelText,
    String? confirmText,
  }) async {
    return await showDialog(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title ?? _l10n.confirm,
          ),
          content: content,
          actions: <Widget>[
            TextButton(
              onPressed: () => context.pop(false),
              child: Text(
                cancelText ?? _l10n.cancel,
              ),
            ),
            TextButton(
              onPressed: () => context.pop(true),
              child: Text(
                confirmText ?? _l10n.accept,
              ),
            ),
          ],
        );
      },
    );
  }

  ///
  /// Wraps the [showDialog] method and builds a [SimpleDialog]
  ///
  Future<T?> showSimpleDialog<T>({
    required Widget title,
    required List<Widget> children,
  }) async {
    return showDialog<T>(
      context: this,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: title,
          children: children,
        );
      },
    );
  }

  ///
  /// Wraps the [showModalBottomSheet] method
  ///
  Future<T?> showBottomSheet<T>({
    required Widget child,
    bool isScrollControlled = false,
    bool isDismissible = true,
  }) async {
    return showModalBottomSheet<T>(
      context: this,
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      builder: (BuildContext context) {
        return child;
      },
    );
  }

  ///
  /// Wraps the [showDatePicker] method
  ///
  Future<DateTime?> showCalendar({
    DateTime? firstDate,
    DateTime? initialDate,
    DateTime? lastDate,
  }) {
    return showDatePicker(
      context: this,
      firstDate: firstDate ?? DateTime.now(),
      initialDate: initialDate ?? DateTime.now(),
      lastDate: lastDate ?? DateTime.now().add(const Duration(days: 365)),
    );
  }
}

extension FocusScopeExtension on BuildContext {
  FocusScopeNode get focusScope => FocusScope.of(this);

  ///
  /// Wraps the [FocusScope.requestFocus] method
  ///
  void requestFocus([FocusNode? node]) {
    focusScope.requestFocus(node);
  }
}

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

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get deviceSize => mediaQuery.size;

  double get height => deviceSize.height;

  double get width => deviceSize.width;

  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;

  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;

  double getProportionateScreenHeight(
    double height, [
    double layoutHeight = 812.0,
  ]) {
    return (height / layoutHeight) * height;
  }

  double getProportionateScreenWidth(
    double width, [
    double layoutWidth = 315.0,
  ]) {
    return (width / layoutWidth) * width;
  }

  double heightTransformer({
    double dividedBy = 1.0,
    double reducedBy = 0.0,
  }) {
    return (height - ((height / 100) * reducedBy)) / dividedBy;
  }

  double widthTransformer({
    double dividedBy = 1.0,
    reducedBy = 0.0,
  }) {
    return (width - ((width / 100) * reducedBy)) / dividedBy;
  }

  double ratio({
    double dividedBy = 1.0,
    double reducedByW = 0.0,
    double reducedByH = 0.0,
  }) {
    return heightTransformer(dividedBy: dividedBy, reducedBy: reducedByH) /
        widthTransformer(dividedBy: dividedBy, reducedBy: reducedByW);
  }
}

extension ModalRouteExtension on BuildContext {
  ModalRoute<dynamic> get modalRoute => ModalRoute.of(this)!;
}

extension NavigatorExtension on BuildContext {
  Future<T?> push<T>(Widget page) {
    return Navigator.push(
      this,
      MaterialPageRoute<T>(builder: (_) => page),
    );
  }

  ///
  /// Wraps the [Navigator.pop] method
  ///
  void pop([Object? result]) {
    Navigator.pop(this, result);
  }

  ///
  /// Wraps the [Navigator.mabyPop] method
  ///
  Future<bool> maybePop([Object? result]) {
    return Navigator.maybePop(this, result);
  }

  ///
  /// Wraps the [Navigator.pushReplacement] method
  ///
  Future<T?> pushReplacement<T>(Widget page) {
    return Navigator.pushReplacement(
      this,
      MaterialPageRoute<T>(builder: (_) => page),
    );
  }

  ///
  /// Wraps the [Navigator.pushAndRemoveUntil] method
  ///
  Future<T?> pushAndRemove<T>(Widget page) {
    return Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute<T>(builder: (_) => page),
      (Route<dynamic> route) => false,
    );
  }
}

extension ScaffoldExtension on BuildContext {
  ScaffoldState get scaffold => Scaffold.of(this);

  ///
  /// Wraps the [Scaffold.openDrawer] method
  ///
  void openDrawer() {
    scaffold.openDrawer();
  }

  ///
  /// Wraps the [Scaffold.closeDrawer] method
  ///
  void closeDrawer() {
    scaffold.closeDrawer();
  }
}

extension ScaffoldMessengerExtension on BuildContext {
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  ///
  /// Wraps the [ScaffoldMessenger.showMaterialBanner] method
  ///
  void showMaterialBanner(
    String text, {
    Widget icon = const Icon(Icons.info),
  }) {
    scaffoldMessenger
      ..hideCurrentMaterialBanner()
      ..showMaterialBanner(
        MaterialBanner(
          content: Text(text),
          leading: icon,
          actions: <Widget>[
            TextButton(
              child: Text(_l10n.dismiss),
              onPressed: () => scaffoldMessenger.hideCurrentMaterialBanner(),
            ),
          ],
        ),
      );
  }

  ///
  /// Wraps the [ScaffoldMessenger.clearMaterialBanners] method
  ///
  void closeMaterialBanner() {
    scaffoldMessenger.clearMaterialBanners();
  }

  ///
  /// Wraps the [ScaffoldMessenger.showSnackBar] method
  ///
  void showSnackBar(
    String text, {
    SnackBarAction? action,
    int? duration,
  }) {
    scaffoldMessenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(text),
          duration: Duration(seconds: kDebugMode ? 90 : duration ?? 10),
          action: action ??
              SnackBarAction(
                label: _l10n.dismiss,
                onPressed: () => scaffoldMessenger.hideCurrentSnackBar(),
              ),
        ),
      );
  }

  ///
  /// Wraps the [ScaffoldMessenger.clearSnackBars] method
  ///
  void closeSnackBar() {
    scaffoldMessenger.clearSnackBars();
  }
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  IconThemeData get iconTheme => theme.iconTheme;

  TextTheme get textTheme => theme.textTheme;
}