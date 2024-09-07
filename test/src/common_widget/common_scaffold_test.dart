import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pest_gpt/src/common_widget/common_scaffold.dart';

void main() {
  testWidgets('CommonScaffold displays body widget', (WidgetTester tester) async {
    // Arrange
    const bodyKey = Key('body');
    const bodyWidget = SizedBox(key: bodyKey);

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: CommonScaffold(
          body: bodyWidget,
        ),
      ),
    );

    // Assert
    expect(find.byKey(bodyKey), findsOneWidget);
  });

  testWidgets('CommonScaffold displays appBar when provided', (WidgetTester tester) async {
    // Arrange
    const appBarTitle = 'Test AppBar';
    final appBar = AppBar(title: Text(appBarTitle));

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: CommonScaffold(
          body: SizedBox(),
          appBar: appBar,
        ),
      ),
    );

    // Assert
    expect(find.text(appBarTitle), findsOneWidget);
  });

  testWidgets('CommonScaffold does not display appBar when not provided', (WidgetTester tester) async {
    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: CommonScaffold(
          body: SizedBox(),
        ),
      ),
    );

    // Assert
    expect(find.byType(AppBar), findsNothing);
  });

  testWidgets('CommonScaffold displays floatingActionButton when provided', (WidgetTester tester) async {
    // Arrange
    const fabKey = Key('fab');
    final floatingActionButton = FloatingActionButton(
      key: fabKey,
      onPressed: () {},
    );

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: CommonScaffold(
          body: SizedBox(),
          floatingActionButton: floatingActionButton,
        ),
      ),
    );

    // Assert
    expect(find.byKey(fabKey), findsOneWidget);
  });
}