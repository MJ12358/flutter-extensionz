part of flutter_extensionz;

extension BuildContextExtension on BuildContext {
  /// Wraps the `showDialog` method and builds an `AlertDialog`.
  Future<bool> showAlertDialog(
    Widget content, {
    String title = 'Confirm',
    String cancelText = 'Cancel',
    String acceptText = 'Accept',
  }) async {
    return await showDialog(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: content,
          actions: <Widget>[
            TextButton(
              onPressed: () => context.pop(false),
              child: Text(cancelText),
            ),
            TextButton(
              onPressed: () => context.pop(true),
              child: Text(acceptText),
            ),
          ],
        );
      },
    );
  }

  /// Wraps the `showDialog` method and builds a `SimpleDialog`.
  Future<T?> showSimpleDialog<T>({
    required Widget title,
    required List<Widget> children,
  }) async {
    return showDialog<T>(
      context: this,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: title,
          children: children,
        );
      },
    );
  }

  /// Wraps the `showModalBottomSheet` method.
  Future<T?> showBottomSheet<T>({
    required Widget child,
    bool isScrollControlled = false,
    bool isDismissible = true,
  }) async {
    return showModalBottomSheet<T>(
      context: this,
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      builder: (BuildContext context) {
        return child;
      },
    );
  }

  /// Wraps the `showDatePicker` method.
  Future<DateTime?> showDatePicker({
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    DateTime? currentDate,
    DatePickerEntryMode entryMode = DatePickerEntryMode.calendar,
    DatePickerMode pickerMode = DatePickerMode.day,
  }) {
    return date_picker.showDatePicker(
      context: this,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime.now(),
      lastDate: lastDate ?? DateTime.now().add(const Duration(days: 365)),
      currentDate: currentDate,
      initialEntryMode: entryMode,
      initialDatePickerMode: pickerMode,
    );
  }
}
