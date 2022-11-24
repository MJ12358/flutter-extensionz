import 'package:flutter/material.dart';
import 'package:flutter_extensions/flutter_extensions.dart';

extension BuildContextExtension on BuildContext {
  ///
  /// Wraps the [showDialog] method and builds an [AlertDialog]
  ///
  Future<bool> showAlertDialog(
    Widget content, {
    String? title,
    String? cancelText,
    String? confirmText,
  }) async {
    return await showDialog(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title ?? fl10n.confirm,
          ),
          content: content,
          actions: <Widget>[
            TextButton(
              onPressed: () => context.pop(false),
              child: Text(
                cancelText ?? fl10n.cancel,
              ),
            ),
            TextButton(
              onPressed: () => context.pop(true),
              child: Text(
                confirmText ?? fl10n.accept,
              ),
            ),
          ],
        );
      },
    );
  }

  ///
  /// Wraps the [showDialog] method and builds a [SimpleDialog]
  ///
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

  ///
  /// Wraps the [showModalBottomSheet] method
  ///
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

  ///
  /// Wraps the [showDatePicker] method
  ///
  Future<DateTime?> showCalendar({
    DateTime? firstDate,
    DateTime? initialDate,
    DateTime? lastDate,
  }) {
    return showDatePicker(
      context: this,
      firstDate: firstDate ?? DateTime.now(),
      initialDate: initialDate ?? DateTime.now(),
      lastDate: lastDate ?? DateTime.now().add(const Duration(days: 365)),
    );
  }
}
