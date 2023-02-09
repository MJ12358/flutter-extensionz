part of '../flutter_extensionz.dart';

extension ModalRouteExtension on BuildContext {
  ModalRoute<dynamic> get modalRoute => ModalRoute.of(this)!;
}
