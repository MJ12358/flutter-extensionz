part of '../flutter_extensionz.dart';

/// [TimeOfDay] extension.
extension TimeOfDayExtension on TimeOfDay? {
  /// Converts this [TimeOfDay] to a [DateTime] object with today's date.
  DateTime? toDateTime() {
    if (this == null) {
      return null;
    }
    final DateTime now = DateTime.now();
    return DateTime(
      now.year,
      now.month,
      now.day,
      this!.hour,
      this!.minute,
    );
  }

  /// Formats this [TimeOfDay] using the local time format.
  String format(BuildContext context) {
    if (this == null) {
      return '';
    }
    return this!.format(context);
  }
}

/// [DateTime] extension.
extension DateTimeExtension on DateTime? {
  /// Converts this [DateTime] to a [TimeOfDay] object.
  TimeOfDay? toTimeOfDay() {
    if (this == null) {
      return null;
    }
    return TimeOfDay(
      hour: this!.hour,
      minute: this!.minute,
    );
  }
}
