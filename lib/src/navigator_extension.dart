part of flutter_extensionz;

extension NavigatorExtension on BuildContext {
  /// Equivalent to `Navigator.of(context)`.
  NavigatorState get navigator => Navigator.of(this);

  /// Wraps the `Navigator.push` method.
  // TODO: allow custom PageRouteBuilder
  Future<T?> push<T>(Widget page) {
    return Navigator.push(
      this,
      MaterialPageRoute<T>(builder: (_) => page),
    );
  }

  /// Wraps the `Navigator.pop` method.
  void pop([Object? result]) {
    Navigator.pop(this, result);
  }

  /// Wraps the `Navigator.canPop` method.
  bool canPop() {
    return Navigator.canPop(this);
  }

  /// Wraps the `Navigator.mabyPop` method.
  Future<bool> maybePop<T>([T? result]) {
    return Navigator.maybePop<T>(this, result);
  }

  /// Wraps the `Navigator.pushReplacement` method.
  Future<T?> pushReplacement<T>(Widget page) {
    return Navigator.pushReplacement(
      this,
      MaterialPageRoute<T>(builder: (_) => page),
    );
  }

  /// Wraps the `Navigator.pushAndRemoveUntil` method.
  Future<T?> pushAndRemove<T>(Widget page) {
    return Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute<T>(builder: (_) => page),
      (Route<dynamic> route) => false,
    );
  }

  void safePush(Widget page) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        push(page);
      }
    });
  }

  void safePop([Object? result]) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        pop(result);
      }
    });
  }

  void safePushReplacement(Widget page) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        pushReplacement(page);
      }
    });
  }

  void safePushAndRemove(Widget page) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        pushAndRemove(page);
      }
    });
  }
}
