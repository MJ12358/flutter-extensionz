import 'package:flutter/material.dart';
import 'package:flutter_extensionz/flutter_extensionz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('brightness', () {
    expect(Colors.black.brightness, Brightness.dark);
    expect(Colors.white.brightness, Brightness.light);
    expect(Colors.deepPurple.brightness, Brightness.dark);
    expect(Colors.yellow.brightness, Brightness.light);
  });

  test('blackOrWhite', () {
    const Color black = Colors.black;
    const Color white = Colors.white;

    expect(Colors.black.blackOrWhite, white);
    expect(Colors.white.blackOrWhite, black);
    expect(Colors.deepPurple.blackOrWhite, white);
    expect(Colors.yellow.blackOrWhite, black);
  });

  test('name', () {
    expect(Colors.red.name, 'Red');
    expect(Colors.pink.name, 'Pink');
    expect(Colors.purple.name, 'Purple');
    expect(Colors.deepPurple.name, 'Deep Purple');
    expect(Colors.indigo.name, 'Indigo');
    expect(Colors.blue.name, 'Blue');
    expect(Colors.lightBlue.name, 'Light Blue');
    expect(Colors.cyan.name, 'Cyan');
    expect(Colors.teal.name, 'Teal');
    expect(Colors.green.name, 'Green');
    expect(Colors.lightGreen.name, 'Light Green');
    expect(Colors.lime.name, 'Lime');
    expect(Colors.yellow.name, 'Yellow');
    expect(Colors.amber.name, 'Amber');
    expect(Colors.orange.name, 'Orange');
    expect(Colors.deepOrange.name, 'Deep Orange');
    expect(Colors.brown.name, 'Brown');
    expect(Colors.blueGrey.name, 'Blue Grey');
    expect(Colors.black.name, 'Black');
    expect(Colors.white.name, 'White');
    expect(Colors.transparent.name, 'Transparent');
    expect(const Color(0xFF123456).name, 'Unknown');
  });

  // TODO: This is not giving the expected result
  // test('toInt', () {
  //   expect(Colors.red.toInt(), 0xFFFF0000);
  //   expect(Colors.green.toInt(), 0xFF00FF00);
  //   expect(Colors.blue.toInt(), 0xFF0000FF);
  //   expect(Colors.black.toInt(), 0xFF000000);
  //   expect(Colors.white.toInt(), 0xFFFFFFFF);
  //   expect(const Color(0xFF123456).toInt(), 0xFF123456);
  // });
}
