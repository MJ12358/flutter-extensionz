part of flutter_extensionz;

extension BuildContextExtension on BuildContext {
  /// Wraps [material.showDialog], which builds a [child].
  ///
  /// [onValue] is called when there is a return value.
  ///
  /// [onCancel] is called when there is no return value.
  Future<T?> showDialog<T>({
    required Widget child,
    Function(T)? onValue,
    Function(T?)? onCancel,
  }) {
    return material
        .showDialog<T?>(
      context: this,
      builder: (_) => child,
    )
        .then((T? value) {
      if (value != null) {
        onValue?.call(value);
      }
      return value;
    });
  }

  /// Wraps the [material.showDialog] method, which builds an [AlertDialog].
  ///
  /// [onAccept] is called when the return value is true.
  ///
  /// [onCancel] is called when the return value is false.
  Future<bool?> showAlertDialog(
    Widget content, {
    String title = 'Confirm',
    String acceptText = 'Accept',
    String cancelText = 'Cancel',
    Function()? onAccept,
    Function()? onCancel,
  }) {
    return material
        .showDialog<bool?>(
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
    )
        .then((bool? value) {
      if (value != null && value) {
        onAccept?.call();
      } else {
        onCancel?.call();
      }
      return value;
    });
  }

  /// Wraps the [material.showDialog] method, which builds a [SimpleDialog].
  Future<T?> showSimpleDialog<T>({
    required Widget title,
    required List<Widget> children,
  }) {
    return material.showDialog<T>(
      context: this,
      builder: (_) {
        return SimpleDialog(
          title: title,
          children: children,
        );
      },
    );
  }

  /// Wraps the [showModalBottomSheet] method.
  Future<T?> showBottomSheet<T>({
    required Widget child,
    bool isScrollControlled = false,
    bool isDismissible = true,
  }) {
    return showModalBottomSheet<T>(
      context: this,
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      builder: (_) {
        return child;
      },
    );
  }

  /// Wraps the [showDatePicker] method.
  Future<DateTime?> showDatePicker({
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    DateTime? currentDate,
    DatePickerEntryMode entryMode = DatePickerEntryMode.calendar,
    DatePickerMode pickerMode = DatePickerMode.day,
  }) {
    return material.showDatePicker(
      context: this,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime.fromMillisecondsSinceEpoch(0),
      lastDate: lastDate ??
          DateTime.fromMillisecondsSinceEpoch(double.maxFinite.toInt()),
      currentDate: currentDate,
      initialEntryMode: entryMode,
      initialDatePickerMode: pickerMode,
    );
  }
}
