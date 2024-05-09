part of flutter_extensionz;

extension TextEditingControllerExtension on TextEditingController {
  /// Inserts [value] at the cursor of this controller.
  void insert(String value) {
    final String newText =
        text.replaceRange(selection.start, selection.end, value);
    this.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(
        offset: selection.baseOffset + value.length,
      ),
    );
  }

  /// Select all [text] in this controller.
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
