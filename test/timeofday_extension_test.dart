import 'package:flutter/material.dart';
import 'package:flutter_extensionz/flutter_extensionz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final DateTime now = DateTime.now();
  final DateTime now1 = DateTime(
    now.year,
    now.month,
    now.day,
    5,
    30,
  );
  final DateTime now2 = DateTime(
    now.year,
    now.month,
    now.day,
    17,
    30,
  );
  final TimeOfDay tod1 = TimeOfDay.fromDateTime(now1);
  final TimeOfDay tod2 = TimeOfDay.fromDateTime(now2);

  test('toDateTime', () {
    final DateTime result1 = now1.copyWith(
      hour: tod1.hour,
      minute: tod1.minute,
    );
    final DateTime result2 = now2.copyWith(
      hour: tod2.hour,
      minute: tod2.minute,
    );
    expect(tod1.toDateTime(), result1);
    expect(tod2.toDateTime(), result2);
    expect(null.toDateTime(), null);
  });

  test('toTimeOfDay', () {
    final TimeOfDay result1 = TimeOfDay(
      hour: now1.hour,
      minute: now1.minute,
    );
    final TimeOfDay result2 = TimeOfDay(
      hour: now2.hour,
      minute: now2.minute,
    );
    expect(now1.toTimeOfDay(), result1);
    expect(now2.toTimeOfDay(), result2);
    expect(null.toTimeOfDay(), null);
  });
}
