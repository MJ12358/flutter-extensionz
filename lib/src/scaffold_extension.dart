import 'package:flutter/material.dart';

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
