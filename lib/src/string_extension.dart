part of flutter_extensionz;

extension StringExtension on String {
  /// Convert this string to a [Color].
  ///
  /// Supports both hex and RGB color formats.
  /// Hex formats: '#RRGGBB', 'RRGGBB', '#AARRGGBB', 'AARRGGBB'
  /// RGB formats: 'rgb(r, g, b)', 'rgba(r, g, b, a)'
  Color? toColor([Color? fallback]) {
    final String colorString = trim();

    if (colorString.isEmpty) {
      return fallback;
    }

    // Try to parse as hex color first
    final Color? hexColor = _parseHexColor(colorString);
    if (hexColor != null) {
      return hexColor;
    }

    // Try to parse as RGB color
    final Color? rgbColor = _parseRgbColor(colorString);
    if (rgbColor != null) {
      return rgbColor;
    }

    return fallback;
  }

  /// Parse hex color strings
  Color? _parseHexColor(String colorString) {
    String hex = colorString.replaceFirst('#', '');

    // Handle 3-digit hex shorthand (e.g., #RGB -> RRGGBB)
    if (hex.length == 3) {
      hex = hex.split('').map((String c) => c + c).join();
    }

    // Handle 6-digit hex (add alpha ff)
    if (hex.length == 6) {
      hex = 'ff$hex';
    }

    // Handle 8-digit hex (already has alpha)
    if (hex.length == 8) {
      final int? value = int.tryParse(hex, radix: 16);
      if (value != null) {
        return Color(value);
      }
    }

    return null;
  }

  /// Parse RGB color strings
  Color? _parseRgbColor(String colorString) {
    final RegExp rgbRegex = RegExp(
      r'^rgba?\((\d+),\s*(\d+),\s*(\d+)(?:,\s*([\d.]+))?\)$',
      caseSensitive: false,
    );

    final Match? match = rgbRegex.firstMatch(colorString);
    if (match == null) {
      return null;
    }

    try {
      final int r = int.parse(match.group(1)!);
      final int g = int.parse(match.group(2)!);
      final int b = int.parse(match.group(3)!);
      double a = 1.0;

      // Parse alpha if provided
      if (match.group(4) != null) {
        a = double.parse(match.group(4)!);
        // Clamp alpha between 0.0 and 1.0
        a = a.clamp(0.0, 1.0);
      }

      // Validate RGB values (0-255)
      if (r < 0 || r > 255 || g < 0 || g > 255 || b < 0 || b > 255) {
        return null;
      }

      return Color.fromRGBO(r, g, b, a);
    } catch (e) {
      return null;
    }
  }
}
