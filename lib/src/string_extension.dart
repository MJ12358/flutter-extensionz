part of flutter_extensionz;

extension StringExtension on String {
  /// Convert this string into a Color.
  ///
  /// Only hex strings currently supported.
  Color? toColor([Color? fallback]) {
    if (trim().isEmpty) {
      return fallback;
    }

    final StringBuffer buffer = StringBuffer();

    if (length == 6 || length == 7) {
      buffer.write('ff');
    }

    buffer.write(replaceFirst('#', ''));

    final int? value = int.tryParse(buffer.toString(), radix: 16);

    if (value == null) {
      return fallback;
    }

    return Color(value);
  }
}
