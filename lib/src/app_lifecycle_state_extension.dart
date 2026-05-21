part of '../flutter_extensionz.dart';

/// [AppLifecycleState] extension.
extension AppLifecycleStateExtension on AppLifecycleState {
  /// Returns true if the [AppLifecycleState] is [AppLifecycleState.detached].
  bool get isDetached => this == AppLifecycleState.detached;

  /// Returns true if the [AppLifecycleState] is [AppLifecycleState.resumed].
  bool get isResumed => this == AppLifecycleState.resumed;

  /// Returns true if the [AppLifecycleState] is [AppLifecycleState.inactive].
  bool get isInactive => this == AppLifecycleState.inactive;

  /// Returns true if the [AppLifecycleState] is [AppLifecycleState.hidden].
  bool get isHidden => this == AppLifecycleState.hidden;

  /// Returns true if the [AppLifecycleState] is [AppLifecycleState.paused].
  bool get isPaused => this == AppLifecycleState.paused;
}
