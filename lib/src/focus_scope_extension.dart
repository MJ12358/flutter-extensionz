import 'package:flutter/material.dart';

extension FocusScopeExtension on BuildContext {
  FocusScopeNode get focusScope => FocusScope.of(this);

  ///
  /// Wraps the `FocusScope.requestFocus` method
  ///
  void requestFocus([FocusNode? node]) {
    focusScope.requestFocus(node);
  }
}
