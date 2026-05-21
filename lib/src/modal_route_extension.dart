part of '../flutter_extensionz.dart';

/// [ModalRoute] extension.
extension ModalRouteExtension on BuildContext {
  /// Equivalent to [ModalRoute.of(context)].
  ModalRoute<dynamic> get modalRoute => ModalRoute.of(this)!;
}
