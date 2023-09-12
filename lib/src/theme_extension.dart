part of flutter_extensionz;

extension ThemeExtension on BuildContext {
  /// Equivalent to [Theme.of(context)].
  ThemeData get theme => Theme.of(this);

  /// Equivalent to [Theme.of(context).colorScheme].
  ColorScheme get colorScheme => theme.colorScheme;

  /// Equivalent to [Theme.of(context).iconTheme].
  IconThemeData get iconTheme => theme.iconTheme;

  /// Equivalent to [Theme.of(context).textTheme].
  TextTheme get textTheme => theme.textTheme;
}
