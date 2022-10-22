import 'dart:async';

extension DurationExtension on Duration {
  Future<dynamic> delay([FutureOr Function()? callback]) async {
    return Future.delayed(this, callback);
  }
}
