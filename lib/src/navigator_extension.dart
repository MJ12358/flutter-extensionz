import 'package:flutter/material.dart';

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
