
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pest_gpt/src/common_widget/common_app_bar.dart';

void main() {
  testWidgets('CommonAppBar displays title when titleText is provided', (tester) async {
    const titleText = 'Test Title';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: CommonAppBar(
            titleText: titleText,
          ),
        ),
      ),
    );

    expect(find.text(titleText), findsOneWidget);
  });

  testWidgets('CommonAppBar does not display title when titleText is null', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: CommonAppBar(),
        ),
      ),
    );

    expect(find.byType(Text), findsNothing);
  });

  testWidgets('CommonAppBar displays back button when showBackButton is true', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: CommonAppBar(
            showBackButton: true,
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
  });

  testWidgets('CommonAppBar does not display back button when showBackButton is false', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: CommonAppBar(
            showBackButton: false,
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.arrow_back), findsNothing);
  });

  testWidgets('CommonAppBar calls onBackPressed when back button is pressed', (tester) async {
    bool backPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: CommonAppBar(
            onBackPressed: () {
              backPressed = true;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pump();

    expect(backPressed, isTrue);
  });

  testWidgets('CommonAppBar displays actions when provided', (tester) async {
    const actionWidget = Icon(Icons.settings);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: CommonAppBar(
            actions: [actionWidget],
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.settings), findsOneWidget);
  });
}
