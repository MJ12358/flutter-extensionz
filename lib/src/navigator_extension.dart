part of flutter_extensionz;

extension NavigatorExtension on BuildContext {
  /// Equivalent to [Navigator.of(context)].
  NavigatorState get navigator => Navigator.of(this);

  /// Wraps the [Navigator.push] method.
  Future<T?> push<T>(
    Widget page, {
    bool fullscreenDialog = false,
    ValueChanged<T>? onValue,
  }) {
    return navigator
        .push(
      MaterialPageRoute<T>(
        builder: (_) => page,
        fullscreenDialog: fullscreenDialog,
      ),
    )
        .then((T? value) {
      if (value != null) {
        onValue?.call(value);
      }
      return value;
    });
  }

  Future<T?> pushRoute<T>(
    PageRouteBuilder<T> route, {
    ValueChanged<T>? onValue,
  }) {
    return navigator.push(route).then((T? value) {
      if (value != null) {
        onValue?.call(value);
      }
      return value;
    });
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
  Future<T?> pushReplacement<T>(
    Widget page, {
    bool fullScreenDialog = false,
  }) {
    return navigator.pushReplacement(
      MaterialPageRoute<T>(
        fullscreenDialog: fullScreenDialog,
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

  /// Uses [WidgetsBinding.addPostFrameCallback] and
  /// [mounted] to ensure the [page] can be pushed.
  void safePush<T>(
    Widget page, {
    bool fullscreenDialog = false,
    ValueChanged<T>? onValue,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        push(
          page,
          fullscreenDialog: fullscreenDialog,
          onValue: onValue,
        );
      }
    });
  }

  /// Uses [WidgetsBinding.addPostFrameCallback] and
  /// [mounted] to ensure the [Navigator] can be popped.
  void safePop([Object? result]) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        pop(result);
      }
    });
  }

  /// Uses [WidgetsBinding.addPostFrameCallback] and
  /// [mounted] to ensure the [page] can be pushed and replaced.
  void safePushReplacement(
    Widget page, {
    bool fullScreenDialog = false,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        pushReplacement(
          page,
          fullScreenDialog: fullScreenDialog,
        );
      }
    });
  }

  /// Uses [WidgetsBinding.addPostFrameCallback] and
  /// [mounted] to ensure the [page] can be pushed and removed.
  void safePushAndRemove(Widget page) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        pushAndRemove(page);
      }
    });
  }

  /// Wraps the [Navigator.restorablePush] method.
  void restorablePush(
    Widget page, {
    bool fullscreenDialog = false,
  }) {
    navigator.restorablePush((_, __) {
      return MaterialPageRoute<void>(
        builder: (_) => page,
        fullscreenDialog: fullscreenDialog,
      );
    });
  }

  /// Wraps the [Navigator.restorablePushAndRemoveUntil] method.
  void restorablePushAndRemove(Widget page) {
    navigator.restorablePushAndRemoveUntil(
      (_, __) {
        return MaterialPageRoute<void>(
          builder: (_) => page,
        );
      },
      (Route<dynamic> route) => false,
    );
  }
}
