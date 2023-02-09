part of '../flutter_extensionz.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  IconThemeData get iconTheme => theme.iconTheme;

  TextTheme get textTheme => theme.textTheme;
}
