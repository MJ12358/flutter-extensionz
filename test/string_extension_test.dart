import 'package:flutter/material.dart';
import 'package:flutter_extensionz/flutter_extensionz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('toColor (invalid)', () {
    expect(null, ''.toColor());
    expect(null, 'invalid'.toColor());
    expect(null, 'not a color'.toColor());
  });
  test('toColor (hex)', () {
    expect(Colors.black, '000000'.toColor());
    expect(Colors.black, '#000000'.toColor());
    expect(Colors.black, '000'.toColor());
    expect(Colors.black, '#000'.toColor());
    expect(Colors.white, 'ffffff'.toColor());
    expect(Colors.white, '#ffffff'.toColor());
    expect(Colors.white, 'fff'.toColor());
    expect(Colors.white, '#fff'.toColor());
  });

  test('toColor (RGB)', () {
    expect(Colors.black, 'rgb(0, 0, 0)'.toColor());
    expect(Colors.black, 'rgb(0,0,0)'.toColor());
    expect(Colors.black, 'rgba(0, 0, 0)'.toColor());
    expect(Colors.black, 'rgba(0,0,0)'.toColor());
    expect(Colors.white, 'rgb(255, 255, 255)'.toColor());
    expect(Colors.white, 'rgb(255,255,255)'.toColor());
    expect(Colors.white, 'rgba(255, 255, 255)'.toColor());
    expect(Colors.white, 'rgba(255,255,255)'.toColor());
  });

  test('toColor (fallback)', () {
    expect(Colors.black, ''.toColor(Colors.black));
    expect(Colors.white, ''.toColor(Colors.white));
    expect(Colors.white, 'invalid'.toColor(Colors.white));
    expect(Colors.black, 'not a color'.toColor(Colors.black));
  });
}
