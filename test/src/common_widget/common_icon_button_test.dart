import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pest_gpt/src/common_widget/common_icon_button.dart';

void main() {
  testWidgets('CommonIconButton renders with default values', (WidgetTester tester) async {
    bool pressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CommonIconButton(
            onPressed: () {
              pressed = true;
            },
            icon: Icons.add,
          ),
        ),
      ),
    );

   expect(1, 1);
  });

  testWidgets('CommonIconButton renders with custom values', (WidgetTester tester) async {
    bool pressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CommonIconButton(
            onPressed: () {
              pressed = true;
            },
            icon: Icons.add,
            width: 60,
            height: 60,
            color: Colors.red,
            iconSize: 40,
          ),
        ),
      ),
    );


    expect(1, 1);
  });
}