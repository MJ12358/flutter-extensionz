import 'dart:async';

extension NumberExtension on num {
  Future<dynamic> delay([FutureOr Function()? callback]) async {
    Future.delayed(
      Duration(milliseconds: (this * 1000).round()),
      callback,
    );
  }

  Duration get milliseconds {
    return Duration(microseconds: (this * 1000).round());
  }

  Duration get seconds {
    return Duration(milliseconds: (this * 1000).round());
  }

  Duration get minutes {
    return Duration(seconds: (this * Duration.secondsPerMinute).round());
  }

  Duration get hours {
    return Duration(minutes: (this * Duration.minutesPerHour).round());
  }

  Duration get days {
    return Duration(hours: (this * Duration.hoursPerDay).round());
  }
}
