part of flutter_extensionz;

extension AppLifecycleStateExtension on AppLifecycleState {
  bool get isDetached => this == AppLifecycleState.detached;
  bool get isResumed => this == AppLifecycleState.resumed;
  bool get isInactive => this == AppLifecycleState.inactive;
  bool get isHidden => this == AppLifecycleState.hidden;
  bool get isPaused => this == AppLifecycleState.paused;
}
