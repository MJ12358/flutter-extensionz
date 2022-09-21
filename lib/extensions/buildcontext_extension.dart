import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextExtension on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;

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
            title ?? localizations.confirm,
          ),
          content: content,
          actions: <Widget>[
            TextButton(
              onPressed: () => context.pop(false),
              child: Text(
                cancelText ?? localizations.cancel,
              ),
            ),
            TextButton(
              onPressed: () => context.pop(true),
              child: Text(
                confirmText ?? localizations.accept,
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> showSimpleDialog(
    Widget title,
    List<Widget> children,
  ) async {
    return showDialog(
      context: this,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: title,
          children: children,
        );
      },
    );
  }

  Future<void> showBottomSheet(Widget child) async {
    return showModalBottomSheet<void>(
      context: this,
      builder: (BuildContext context) {
        return child;
      },
    );
  }
}

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get deviceSize => mediaQuery.size;

  double getProportionateScreenHeight(double height) {
    final double screenHeight = deviceSize.height;
    return (height / 812.0) * screenHeight;
  }

  double getProportionateScreenWidth(double width) {
    final double screenWidth = deviceSize.width;
    return (width / 375.0) * screenWidth;
  }
}

extension ModalRouteExtension on BuildContext {
  ModalRoute<dynamic> get modalRoute => ModalRoute.of(this)!;
}

extension NavigatorExtension on BuildContext {
  void push(Widget page) {
    Navigator.push(
      this,
      MaterialPageRoute<dynamic>(builder: (_) => page),
    );
  }

  void pop([Object? result]) {
    Navigator.pop(this, result);
  }

  void maybePop([Object? result]) {
    Navigator.maybePop(this, result);
  }

  void pushReplacement(Widget page) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute<dynamic>(builder: (_) => page),
    );
  }

  void pushAndRemove(Widget page) {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute<dynamic>(builder: (_) => page),
      (Route<dynamic> route) => false,
    );
  }
}

extension ScaffoldExtension on BuildContext {
  ScaffoldState get scaffold => Scaffold.of(this);

  void openDrawer() {
    scaffold.openDrawer();
  }

  void closeDrawer() {
    scaffold.openEndDrawer();
  }
}

extension ScaffoldMessengerExtension on BuildContext {
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  void showMaterialBanner(
    String content, {
    Widget icon = const Icon(Icons.info),
  }) {
    scaffoldMessenger
      ..hideCurrentMaterialBanner()
      ..showMaterialBanner(
        MaterialBanner(
          content: Text(content),
          leading: icon,
          actions: <Widget>[
            TextButton(
              child: Text(localizations.dismiss),
              onPressed: () => scaffoldMessenger.hideCurrentMaterialBanner(),
            ),
          ],
        ),
      );
  }

  void showSnackBar(
    String text, {
    SnackBarAction? action,
  }) {
    scaffoldMessenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(text),
          duration: const Duration(seconds: kDebugMode ? 90 : 10),
          action: action ??
              SnackBarAction(
                label: localizations.dismiss,
                onPressed: () => scaffoldMessenger.hideCurrentSnackBar(),
              ),
        ),
      );
  }
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;
}
