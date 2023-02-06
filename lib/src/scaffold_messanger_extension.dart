import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extensionz/flutter_extensionz.dart';

extension ScaffoldMessengerExtension on BuildContext {
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  ///
  /// Wraps the `ScaffoldMessenger.showMaterialBanner` method
  ///
  void showMaterialBanner(
    Widget content, {
    Widget icon = const Icon(Icons.info),
  }) {
    scaffoldMessenger
      ..hideCurrentMaterialBanner()
      ..showMaterialBanner(
        MaterialBanner(
          content: content,
          leading: icon,
          actions: <Widget>[
            TextButton(
              child: Text(flutterExtensionzLocalizations.dismiss),
              onPressed: () => scaffoldMessenger.hideCurrentMaterialBanner(),
            ),
          ],
        ),
      );
  }

  ///
  /// Wraps the `ScaffoldMessenger.clearMaterialBanners` method
  ///
  void closeMaterialBanner() {
    scaffoldMessenger.clearMaterialBanners();
  }

  ///
  /// Wraps the `ScaffoldMessenger.showSnackBar` method
  ///
  void showSnackBar(
    Widget content, {
    SnackBarAction? action,
    int? duration,
  }) {
    scaffoldMessenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: content,
          duration: Duration(seconds: kDebugMode ? 90 : duration ?? 10),
          action: action ??
              SnackBarAction(
                label: flutterExtensionzLocalizations.dismiss,
                onPressed: () => scaffoldMessenger.hideCurrentSnackBar(),
              ),
        ),
      );
  }

  ///
  /// Wraps the `ScaffoldMessenger.clearSnackBars` method
  ///
  void closeSnackBar() {
    scaffoldMessenger.clearSnackBars();
  }
}
