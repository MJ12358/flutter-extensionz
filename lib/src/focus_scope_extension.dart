part of flutter_extensionz;

extension FocusScopeExtension on BuildContext {
  /// Equivalent to [FocusScope.of(context)].
  FocusScopeNode get focusScope => FocusScope.of(this);

  /// Wraps the [FocusScope.of(context).requestFocus] method.
  void requestFocus([FocusNode? node]) {
    focusScope.requestFocus(node);
  }
}
