part of flutter_extensionz;

extension TimeOfDayExtension on TimeOfDay {
  DateTime toDateTime() {
    return DateTime(0, 1, 1, hour, minute);
  }
}
