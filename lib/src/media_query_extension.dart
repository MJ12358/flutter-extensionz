part of '../flutter_extensionz.dart';

/// [MediaQuery] extension.
extension MediaQueryExtension on BuildContext {
  /// Equivalent to [MediaQuery.of(context)].
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Equivalent to [MediaQuery.of(context).size].
  Size get deviceSize => MediaQuery.sizeOf(this);

  /// Equivalent to [MediaQuery.of(context).size.height].
  double get height => deviceSize.height;

  /// Equivalent to [MediaQuery.of(context).size.width].
  double get width => deviceSize.width;

  /// Determines if the [Orientation] is landscape.
  bool get isLandscape =>
      MediaQuery.orientationOf(this) == Orientation.landscape;

  /// Determines if the [Orientation] is portrait.
  bool get isPortrait => MediaQuery.orientationOf(this) == Orientation.portrait;

  /// Determines if the soft keyboard is visible.
  bool get isKeyboardVisible => MediaQuery.viewInsetsOf(this).bottom == 0;

  /// Get the proportionate height as per screen size.
  double getProportionateScreenHeight(
    double height, [
    double layoutHeight = 812.0,
  ]) {
    return (height / layoutHeight) * height;
  }

  /// Get the proportionate width as per screen size.
  double getProportionateScreenWidth(
    double width, [
    double layoutWidth = 315.0,
  ]) {
    return (width / layoutWidth) * width;
  }

  /// Transform the height based on
  /// the given [dividedBy] and [reducedBy] values.
  double heightTransformer({
    double dividedBy = 1.0,
    double reducedBy = 0.0,
  }) {
    return (height - ((height / 100) * reducedBy)) / dividedBy;
  }

  /// Transform the width based on
  /// the given [dividedBy] and [reducedBy] values.
  double widthTransformer({
    double dividedBy = 1.0,
    double reducedBy = 0.0,
  }) {
    return (width - ((width / 100) * reducedBy)) / dividedBy;
  }

  /// Get the ratio of the height to the width based on
  /// the given [dividedBy], [reducedByW] and [reducedByH] values.
  double ratio({
    double dividedBy = 1.0,
    double reducedByW = 0.0,
    double reducedByH = 0.0,
  }) {
    return heightTransformer(dividedBy: dividedBy, reducedBy: reducedByH) /
        widthTransformer(dividedBy: dividedBy, reducedBy: reducedByW);
  }
}
