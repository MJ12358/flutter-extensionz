import 'package:flutter/material.dart';
import 'package:flutter_extensionz/flutter_extensionz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  MockBuildContext context = MockBuildContext();

  setUp(() {
    context = MockBuildContext();
  });

  test('currencySymbol', () {
    expect(context.currencySymbol, r'$');
  });

  test('formatCurrency', () {
    expect(context.formatCurrency(1), r'$1.00');
  });

  test('formatDate', () {
    expect(context.formatDate(DateTime(2020)), '01/01/2020');
  });

  test('formatNumber', () {
    expect(context.formatNumber(2.5), '2.5');
  });

  test('formatPercent', () {
    expect(context.formatPercent(.5), '50%');
  });
}
