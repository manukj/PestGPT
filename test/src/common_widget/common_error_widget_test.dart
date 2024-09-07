import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_error_widget.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';

void main() {
  testWidgets('CommonErrorWidget displays message and lottie animation', (WidgetTester tester) async {
    const message = 'An error occurred';
    const lottieAssetPath = 'assets/error.json';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CommonErrorWidget(
            message: message,
            lottieAssetPath: lottieAssetPath,
          ),
        ),
      ),
    );

    expect(find.text(message), findsOneWidget);
  });

  testWidgets('CommonErrorWidget displays retry button when hideRetryButton is false', (WidgetTester tester) async {
    const message = 'An error occurred';
    const lottieAssetPath = 'assets/error.json';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CommonErrorWidget(
            message: message,
            lottieAssetPath: lottieAssetPath,
            hideRetryButton: false,
          ),
        ),
      ),
    );

    expect(find.text(StringConstant.tryAgain.tr), findsOneWidget);
  });

  testWidgets('CommonErrorWidget hides retry button when hideRetryButton is true', (WidgetTester tester) async {
    const message = 'An error occurred';
    const lottieAssetPath = 'assets/error.json';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CommonErrorWidget(
            message: message,
            lottieAssetPath: lottieAssetPath,
            hideRetryButton: true,
          ),
        ),
      ),
    );

    expect(find.text(StringConstant.tryAgain.tr), findsNothing);
  });
}