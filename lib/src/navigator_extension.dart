part of flutter_extensionz;

extension NavigatorExtension on BuildContext {
  /// Equivalent to [Navigator.of(context)].
  NavigatorState get navigator => Navigator.of(this);

  /// Wraps the [Navigator.push] method.
  Future<T?> push<T>(
    Widget page, {
    bool fullscreenDialog = false,
  }) {
    return navigator.push(
      MaterialPageRoute<T>(
        builder: (_) => page,
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }

  Future<T?> pushRoute<T>(PageRouteBuilder<T> route) {
    return navigator.push(route);
  }

  void popRoute<T>(PageRouteBuilder<T> route) {
    navigator.pop(route);
  }

  /// Wraps the [Navigator.pop] method.
  void pop([Object? result]) {
    navigator.pop(result);
  }

  /// Wraps the [Navigator.canPop] method.
  bool canPop() {
    return navigator.canPop();
  }

  /// Wraps the [Navigator.maybePop] method.
  Future<bool> maybePop<T>([T? result]) {
    return navigator.maybePop<T>(result);
  }

  /// Wraps the [Navigator.pushReplacement] method.
  Future<T?> pushReplacement<T>(Widget page) {
    return navigator.pushReplacement(
      MaterialPageRoute<T>(
        builder: (_) => page,
      ),
    );
  }

  /// Wraps the [Navigator.pushAndRemoveUntil] method.
  Future<T?> pushAndRemove<T>(Widget page) {
    return navigator.pushAndRemoveUntil(
      MaterialPageRoute<T>(
        builder: (_) => page,
      ),
      (Route<dynamic> route) => false,
    );
  }

  /// Uses [WidgetsBinding.instance.postFrameCallback] and
  /// [mounted] to ensure the [page] can be pushed.
  void safePush(Widget page) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        push(page);
      }
    });
  }

  /// Uses [WidgetsBinding.instance.postFrameCallback] and
  /// [mounted] to ensure the [Navigator] can be popped.
  void safePop([Object? result]) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        pop(result);
      }
    });
  }

  /// Uses [WidgetsBinding.instance.postFrameCallback] and
  /// [mounted] to ensure the [page] can be pushed and replaced.
  void safePushReplacement(Widget page) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        pushReplacement(page);
      }
    });
  }

  /// Uses [WidgetsBinding.instance.postFrameCallback] and
  /// [mounted] to ensure the [page] can be pushed and removed.
  void safePushAndRemove(Widget page) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        pushAndRemove(page);
      }
    });
  }
}
