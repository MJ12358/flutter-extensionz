import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extensions/flutter_extensions.dart';

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
