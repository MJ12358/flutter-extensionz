part of '../flutter_extensionz.dart';

extension StringExtension on String {
  /// Convert this string into a Color
  ///
  /// Only hex strings currently supported
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
