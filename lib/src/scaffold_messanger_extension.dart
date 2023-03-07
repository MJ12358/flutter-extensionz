part of flutter_extensionz;

extension ScaffoldMessengerExtension on BuildContext {
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  /// Wraps the `ScaffoldMessenger.of(context).showMaterialBanner` method.
  ///
  /// While also hiding the current material banner.
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

  /// Wraps the `ScaffoldMessenger.of(context).clearMaterialBanners` method.
  void closeMaterialBanner() {
    scaffoldMessenger.clearMaterialBanners();
  }

  /// Wraps the `ScaffoldMessenger.of(context).showSnackBar` method.
  ///
  /// While also hiding the current snackbar.
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

  /// Wraps the `ScaffoldMessenger.of(context).clearSnackBars` method.
  void closeSnackBar() {
    scaffoldMessenger.clearSnackBars();
  }
}
