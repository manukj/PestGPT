import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';
import 'package:pest_gpt/src/common_widget/common_loader.dart';

void main() {
  testWidgets('CommonLoader displays loading animation and text', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CommonLoader(),
        ),
      ),
    );

    // Verify the loading animation is displayed
    expect(find.byType(Lottie), findsOneWidget);
    
    // Verify the loading text is displayed
    expect(find.text('Loading...'), findsOneWidget);
  });

  testWidgets('CommonLoader displays custom loading text', (WidgetTester tester) async {
    const customLoadingText = 'Please wait...';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CommonLoader(loadingText: customLoadingText),
        ),
      ),
    );

    // Verify the custom loading text is displayed
    expect(find.text(customLoadingText), findsOneWidget);
  });

  testWidgets('CommonLoader displays button widget when provided', (WidgetTester tester) async {
    const buttonKey = Key('customButton');

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CommonLoader(
            buttonWidget: ElevatedButton(
              key: buttonKey,
              onPressed: () {},
              child: const Text('Retry'),
            ),
          ),
        ),
      ),
    );

    // Verify the button widget is displayed
    expect(find.byKey(buttonKey), findsOneWidget);
    expect(find.text('Retry'), findsOneWidget);
  });
}