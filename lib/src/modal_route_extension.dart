part of flutter_extensionz;

extension ModalRouteExtension on BuildContext {
  /// Equivalent to `ModalRoute.of(context)`.
  ModalRoute<dynamic> get modalRoute => ModalRoute.of(this)!;
}
