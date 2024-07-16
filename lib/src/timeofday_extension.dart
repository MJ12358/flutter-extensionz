part of flutter_extensionz;

extension TimeOfDayExtension on TimeOfDay {
  DateTime toDateTime() {
    return DateTime(0, 1, 1, hour, minute);
  }
}

extension NullableTimeOfDayExtension on TimeOfDay? {
  DateTime? toDateTime() {
    if (this == null) {
      return null;
    }
    return this!.toDateTime();
  }
}

extension DateTimeExtension on DateTime {
  TimeOfDay toTimeOfDay() {
    return TimeOfDay(hour: hour, minute: minute);
  }
}

extension NullableDateTimeExtension on DateTime? {
  TimeOfDay? toTimeOfDay() {
    if (this == null) {
      return null;
    }
    return this!.toTimeOfDay();
  }
}
