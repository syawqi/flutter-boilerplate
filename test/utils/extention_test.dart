import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../lib/utils/extentions.dart';

void main() {
  String text = "capital case";

  test('String must be Title Case', () {
    debugPrint(text.titleCase);
    expect(text.titleCase, "Capital Case");
  });

  test('String must be camelCase', () {
    debugPrint(text.camelCase);
    expect(text.camelCase, "capitalCase");
  });
}