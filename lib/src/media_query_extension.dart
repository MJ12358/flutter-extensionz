part of flutter_extensionz;

extension MediaQueryExtension on BuildContext {
  /// Equivalent to [MediaQuery.of(context)].
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Equivalent to [MediaQuery.of(context).size].
  Size get deviceSize => mediaQuery.size;

  /// Equivalent to [MediaQuery.of(context).size.height].
  double get height => deviceSize.height;

  /// Equivalent to [MediaQuery.of(context).size.width].
  double get width => deviceSize.width;

  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;

  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;

  double getProportionateScreenHeight(
    double height, [
    double layoutHeight = 812.0,
  ]) {
    return (height / layoutHeight) * height;
  }

  double getProportionateScreenWidth(
    double width, [
    double layoutWidth = 315.0,
  ]) {
    return (width / layoutWidth) * width;
  }

  double heightTransformer({
    double dividedBy = 1.0,
    double reducedBy = 0.0,
  }) {
    return (height - ((height / 100) * reducedBy)) / dividedBy;
  }

  double widthTransformer({
    double dividedBy = 1.0,
    double reducedBy = 0.0,
  }) {
    return (width - ((width / 100) * reducedBy)) / dividedBy;
  }

  double ratio({
    double dividedBy = 1.0,
    double reducedByW = 0.0,
    double reducedByH = 0.0,
  }) {
    return heightTransformer(dividedBy: dividedBy, reducedBy: reducedByH) /
        widthTransformer(dividedBy: dividedBy, reducedBy: reducedByW);
  }
}
