# Flutter Extensionz

## 4.3.2

- Add nullable `format` to `TimeOfDayExtension`.

## 4.3.1

- Add nullable `TimeOfDay` and `DateTime` extensions.

## 4.3.0

- Add `TimeOfDayExtension`.
- Add `isKeyboardVisible` to `MediaQueryExtension`.

## 4.2.2

- Add `onValue` callback to `NavigatorExtension.push/pushRoute/safePush`.

## 4.2.1

- Add `onCancel` to `showDialog`.
- Fix dialog callback signatures.

## 4.2.0

- Add `showDialog` to `BuildContextExtension`.

## 4.1.0

- Add `isDark`/`isLight` convenience getters to `ColorExtension`.
- Add `insert` method to `TextEditingControllerExtension`.
- Utilize optimized `MediaQuery` methods.
- Adjust default params for `showDatePicker`.

## 4.0.1

- Hotfix `showAlertDialog` return value.

## 4.0.0

- **BREAKING**:
  - Remove `Intl` related extensions and move to a [separate repository](https://pub.dev/packages/dart_extensionz).

## 3.1.2

- Add `onCancel` and `onAccept` params to `showAlertDialog`;
- Update some comments.

## 3.1.1

- Use `ThemeData.estimateBrightnessForColor` method instead when getting `ColorExtension.brightness`.

## 3.1.0

- Update dependency constraints.

## 3.0.7

- Bump dependencies.

## 3.0.6

- Hotfix alert dialog return value.

## 3.0.5

- Revert closeMessengers on "safe" navigators.

## 3.0.3

- Add `pushRoute` and `popRoute` to navigator.
- Add `closeMessengers` to scaffold messenger.

## 3.0.2

- Add fullscreenDialog option to "push" navigator.

## 3.0.1

- Add "safe" navigators.

## 3.0.0

- **BREAKING**:
  - Remove dependency on baked in localizations in favor of user provided ones.

## 2.2.0

- Add `TextEditingControllerExtension`.

## 2.1.0

- Add currency formatter.
- Update comments.

## 2.0.1

- Bug fix and modify example.

## 2.0.0

- **BREAKING**:
  - Ensure only the `flutter_extensionz.dart` file can be imported.

## 1.0.3

- Use new lint rules.

## 1.0.2

- Fix undefined getter.

## 1.0.1

- Update pubspec and license.

## 1.0.0

- Initial release.
