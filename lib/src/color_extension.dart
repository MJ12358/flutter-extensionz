part of flutter_extensionz;

extension ColorExtension on Color {
  /// Returns the [Brightness] for this [Color].
  Brightness get brightness {
    return ThemeData.estimateBrightnessForColor(this);
  }

  /// Determines whether the given [Color] is dark.
  bool get isDark => brightness == Brightness.dark;

  /// Determines whether the given [Color] is light.
  bool get isLight => brightness == Brightness.light;

  /// Get black or white based on the brightness of this [Color].
  Color get blackOrWhite {
    return brightness == Brightness.dark ? Colors.white : Colors.black;
  }

  /// Convert this [Color] to an integer.
  ///
  /// A 32 bit value representing this color.
  ///
  /// This implementation was copied from the Flutter SDK (painting.dart)
  int toInt() {
    int _floatToInt8(double x) {
      return (x * 255.0).round() & 0xff;
    }

    return _floatToInt8(a) << 24 |
        _floatToInt8(r) << 16 |
        _floatToInt8(g) << 8 |
        _floatToInt8(b) << 0;
  }

  /// Darken a color by [amount].
  Color darken([double amount = 0.1]) {
    final HSLColor hsl = HSLColor.fromColor(this);
    final HSLColor hslDark =
        hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  /// Lighten a color by [amount].
  Color lighten([double amount = 0.1]) {
    final HSLColor hsl = HSLColor.fromColor(this);
    final HSLColor hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }

  /// Get a [Color] shade using the given [value].
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

  /// Get a [MaterialColor] from this [Color].
  MaterialColor get materialColor {
    final List<double> strengths = <double>[.05];
    final Map<int, Color> swatch = <int, Color>{};
    final double r = this.r;
    final double g = this.g;
    final double b = this.b;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (final double strength in strengths) {
      // the color represented should be identical to its own shade500
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        (r + ((ds < 0 ? r : (255 - r)) * ds)).round(),
        (g + ((ds < 0 ? g : (255 - g)) * ds)).round(),
        (b + ((ds < 0 ? b : (255 - b)) * ds)).round(),
        1,
      );
    }
    return MaterialColor(toInt(), swatch);
  }

  /// Get the complimentary color of this [Color].
  Color get complimentary {
    final HSLColor hsl = HSLColor.fromColor(this);
    double hue = hsl.hue + 180;
    if (hue > 360) {
      hue -= 360;
    }
    return HSLColor.fromAHSL(
      a,
      hue,
      hsl.saturation,
      hsl.lightness,
    ).toColor();
  }

  /// Get the name of this [Color].
  ///
  /// Only [MaterialColor]s are supported.
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
      'Grey': Colors.grey,
      'Blue Grey': Colors.blueGrey,
      'White': Colors.white,
      'Black': Colors.black,
      'Transparent': Colors.transparent,
    };
    for (final String key in colorMap.keys) {
      if (colorMap[key]?.toInt() == toInt()) {
        return key;
      }
    }
    return 'Unknown';
  }

  /// Get a random color from [Colors.primaries].
  static Color get random {
    final math.Random random = math.Random();
    final int i = 1 + random.nextInt(Colors.primaries.length - 1);
    return Colors.primaries[i];
  }
}
