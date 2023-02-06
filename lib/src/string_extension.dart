import 'package:flutter/material.dart';

extension StringExtension on String {
  Color? toColor() {
    if (trim().isEmpty) {
      return null;
    }

    final StringBuffer buffer = StringBuffer();

    if (length == 6 || length == 7) {
      buffer.write('ff');
    }

    buffer.write(replaceFirst('#', ''));

    final int? value = int.tryParse(buffer.toString(), radix: 16);

    if (value == null) {
      return null;
    }

    return Color(value);
  }
}
