import 'package:flutter/material.dart';

extension ScaffoldExtension on BuildContext {
  ScaffoldState get scaffold => Scaffold.of(this);

  ///
  /// Wraps the `Scaffold.openDrawer` method
  ///
  void openDrawer() {
    scaffold.openDrawer();
  }

  ///
  /// Wraps the `Scaffold.closeDrawer` method
  ///
  void closeDrawer() {
    scaffold.closeDrawer();
  }

  ///
  /// Wraps the `Scaffold.openEndDrawer` method
  ///
  void openEndDrawer() {
    scaffold.openEndDrawer();
  }

  ///
  /// Wraps the `Scaffold.closeEndDrawer` method
  ///
  void closeEndDrawer() {
    scaffold.closeEndDrawer();
  }
}
