part of flutter_extensionz;

extension ScaffoldMessengerExtension on BuildContext {
  /// Equivalent to [ScaffoldMessanger.of(context)].
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  /// Wraps the [ScaffoldMessenger.of(context).showMaterialBanner] method.
  ///
  /// While also hiding the current material banner.
  void showMaterialBanner(
    Widget content, {
    Widget icon = const Icon(Icons.info),
    String dismissText = 'Dismiss',
  }) {
    scaffoldMessenger
      ..hideCurrentMaterialBanner()
      ..showMaterialBanner(
        MaterialBanner(
          content: Semantics(
            identifier: 'material_banner',
            child: content,
          ),
          leading: icon,
          actions: <Widget>[
            TextButton(
              child: Text(dismissText),
              onPressed: () => scaffoldMessenger.hideCurrentMaterialBanner(),
            ),
          ],
        ),
      );
  }

  /// Wraps the [ScaffoldMessenger.of(context).clearMaterialBanners] method.
  void closeMaterialBanner() {
    scaffoldMessenger.clearMaterialBanners();
  }

  /// Wraps the [ScaffoldMessenger.of(context).showSnackBar] method.
  ///
  /// While also hiding the current snackbar.
  void showSnackBar(
    Widget content, {
    SnackBarAction? action,
    int duration = 10,
    String dismissText = 'Dismiss',
  }) {
    scaffoldMessenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Semantics(
            identifier: 'snack_bar',
            liveRegion: true,
            child: content,
          ),
          duration: Duration(seconds: kDebugMode ? 90 : duration),
          persist: action != null,
          action: action ??
              SnackBarAction(
                label: dismissText,
                onPressed: () => scaffoldMessenger.hideCurrentSnackBar(),
              ),
        ),
      );
  }

  /// Wraps the [ScaffoldMessenger.of(context).clearSnackBars] method.
  void closeSnackBar() {
    scaffoldMessenger.clearSnackBars();
  }

  /// Close all [ScaffoldMessenger] and drawer.
  void closeMessengers() {
    scaffoldMessenger.clearMaterialBanners();
    scaffoldMessenger.clearSnackBars();
    scaffold.closeDrawer();
  }
}
