import 'package:flutter/material.dart';

extension ModalRouteExtension on BuildContext {
  ModalRoute<dynamic> get modalRoute => ModalRoute.of(this)!;
}
