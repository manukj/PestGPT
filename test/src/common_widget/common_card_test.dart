import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';

import '../../../lib/src/common_widget/common_card.dart';

void main() {
  testWidgets('CommonCard displays child widget', (WidgetTester tester) async {
    // Arrange
    const childWidget = Text('Test Child');

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CommonCard(
            child: childWidget,
          ),
        ),
      ),
    );

    // Assert
    expect(find.byWidget(childWidget), findsOneWidget);
  });

  testWidgets('CommonCard has correct width and height', (WidgetTester tester) async {
    // Arrange
    const childWidget = Text('Test Child');
    const double testWidth = 200.0;
    const double testHeight = 100.0;

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CommonCard(
            child: childWidget,
            width: testWidth,
            height: testHeight,
          ),
        ),
      ),
    );

    // Assert
    final neuCardFinder = find.byType(NeuCard);
    final neuCardWidget = tester.widget<NeuCard>(neuCardFinder);
    expect(neuCardWidget.cardWidth, testWidth);
    expect(neuCardWidget.cardHeight, testHeight);
  });

  testWidgets('CommonCard uses theme color for card color', (WidgetTester tester) async {
    // Arrange
    const childWidget = Text('Test Child');
    final theme = ThemeData.light();

    // Act
    await tester.pumpWidget(
      MaterialApp(
        theme: theme,
        home: Scaffold(
          body: CommonCard(
            child: childWidget,
          ),
        ),
      ),
    );

    // Assert
    final neuCardFinder = find.byType(NeuCard);
    final neuCardWidget = tester.widget<NeuCard>(neuCardFinder);
    expect(neuCardWidget.cardColor, theme.colorScheme.surface);
  });
}