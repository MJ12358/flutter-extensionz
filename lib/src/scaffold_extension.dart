part of flutter_extensionz;

extension ScaffoldExtension on BuildContext {
  /// Equivalent to `Scaffold.of(context)`.
  ScaffoldState get scaffold => Scaffold.of(this);

  /// Wraps the `Scaffold.of(context).openDrawer` method.
  void openDrawer() {
    scaffold.openDrawer();
  }

  /// Wraps the `Scaffold.of(context).closeDrawer` method.
  void closeDrawer() {
    scaffold.closeDrawer();
  }

  /// Wraps the `Scaffold.of(context).openEndDrawer` method.
  void openEndDrawer() {
    scaffold.openEndDrawer();
  }

  /// Wraps the `Scaffold.of(context).closeEndDrawer` method.
  void closeEndDrawer() {
    scaffold.closeEndDrawer();
  }
}
