part of flutter_extensionz;

extension TimeOfDayExtension on TimeOfDay {
  DateTime toDateTime() {
    final DateTime now = DateTime.now();
    return DateTime(
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
  }
}

extension NullableTimeOfDayExtension on TimeOfDay? {
  DateTime? toDateTime() {
    if (this == null) {
      return null;
    }
    return this!.toDateTime();
  }

  String format(BuildContext context) {
    if (this == null) {
      return '';
    }
    return this!.format(context);
  }
}

extension DateTimeExtension on DateTime {
  TimeOfDay toTimeOfDay() {
    return TimeOfDay(
      hour: hour,
      minute: minute,
    );
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
