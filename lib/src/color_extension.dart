part of '../flutter_extensionz.dart';

extension ColorExtension on Color {
  /// Determine if a color is `light` or `dark`
  Brightness get brightness {
    final double relativeLuminance = computeLuminance();
    const double threshold = 0.45;
    if ((relativeLuminance + 0.05) * (relativeLuminance + 0.05) > threshold) {
      return Brightness.light;
    }
    return Brightness.dark;
  }

  /// Get black or white based on the brightnes of this color
  Color get blackOrWhite {
    return brightness == Brightness.dark ? Colors.white : Colors.black;
  }

  /// Darken a color by [amount]
  Color darken([double amount = 0.1]) {
    final HSLColor hsl = HSLColor.fromColor(this);
    final HSLColor hslDark =
        hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  /// Lighten a color by [amount]
  Color lighten([double amount = 0.1]) {
    final HSLColor hsl = HSLColor.fromColor(this);
    final HSLColor hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }

  Color shade([double value = 0.5]) {
    if (value <= 0) {
      return materialColor[50]!;
    }
    if (value >= 1) {
      return materialColor[900]!;
    }
    final num mod = math.pow(10.0, 1);
    final int shade = (value * mod).round() * 1000;
    return materialColor[shade ~/ mod]!;
  }

  MaterialColor get materialColor {
    final List<double> strengths = <double>[.05];
    final Map<int, Color> swatch = <int, Color>{};
    final int r = red;
    final int g = green;
    final int b = blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (final double strength in strengths) {
      // the color represented should be identical to its own shade500
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(value, swatch);
  }

  /// Get the complimentary color of this
  Color get complimentary {
    final HSLColor hsl = HSLColor.fromColor(this);
    double hue = hsl.hue + 180;
    if (hue > 360) {
      hue -= 360;
    }
    return HSLColor.fromAHSL(
      opacity,
      hue,
      hsl.saturation,
      hsl.lightness,
    ).toColor();
  }

  /// Get the name of this color
  ///
  /// Only material colors are supported
  String get name {
    final Map<String, Color> colorMap = <String, Color>{
      'Red': Colors.red,
      'Pink': Colors.pink,
      'Purple': Colors.purple,
      'Deep Purple': Colors.deepPurple,
      'Indigo': Colors.indigo,
      'Blue': Colors.blue,
      'Light Blue': Colors.lightBlue,
      'Cyan': Colors.cyan,
      'Teal': Colors.teal,
      'Green': Colors.green,
      'Light Green': Colors.lightGreen,
      'Lime': Colors.lime,
      'Yellow': Colors.yellow,
      'Amber': Colors.amber,
      'Orange': Colors.orange,
      'Deep Orange': Colors.deepOrange,
      'Brown': Colors.brown,
      'Blue Grey': Colors.blueGrey,
    };
    for (final String key in colorMap.keys) {
      if (colorMap[key]?.value == value) {
        return key;
      }
    }
    return 'Unknown';
  }

  /// Get a random color
  static Color get random {
    final math.Random random = math.Random();
    final int i = 1 + random.nextInt(Colors.primaries.length - 1);
    return Colors.primaries[i];
  }
}
