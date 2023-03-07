import 'package:flutter/material.dart';
import 'package:flutter_extensionz/flutter_extensionz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('toColor', () {
    expect(Colors.black, '000000'.toColor());
    expect(Colors.black, '#000000'.toColor());
    expect(Colors.white, 'ffffff'.toColor());
    expect(Colors.white, '#ffffff'.toColor());
    expect(null, ''.toColor());
    expect(null, 'not a color'.toColor());
    expect(Colors.black, ''.toColor(Colors.black));
    expect(Colors.white, ''.toColor(Colors.white));
    expect(Colors.white, 'not a color'.toColor(Colors.white));
  });
}
