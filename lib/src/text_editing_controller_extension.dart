part of flutter_extensionz;

extension TextEditingControllerExtension on TextEditingController {
  void selectAll() {
    if (text.isEmpty) {
      return;
    }
    selection = TextSelection(
      baseOffset: 0,
      extentOffset: text.length,
    );
  }
}
