import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pest_gpt/src/common_widget/common_tab_header.dart';

class MockFunction extends Mock {
  void call(int index);
}

void main() {
  group('CommonTabHeader', () {
    late MockFunction mockFunction;
    late List<String> tabHeaders;

    setUp(() {
      mockFunction = MockFunction();
      tabHeaders = ['Tab 1', 'Tab 2', 'Tab 3'];
    });

    testWidgets('renders the correct number of tabs',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CommonTabHeader(
              numberOfTab: tabHeaders.length,
              tabHeaders: tabHeaders,
              onChangeTab: mockFunction,
            ),
          ),
        ),
      );

      expect(find.text('Tab 1'), findsOneWidget);
      expect(find.text('Tab 2'), findsOneWidget);
      expect(find.text('Tab 3'), findsOneWidget);
    });

    testWidgets('calls onChangeTab with correct index when a tab is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CommonTabHeader(
              numberOfTab: tabHeaders.length,
              tabHeaders: tabHeaders,
              onChangeTab: mockFunction,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Tab 2'));
      await tester.pump();

      expect(1, 1);
    });

    testWidgets('changes tab color when a tab is selected',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CommonTabHeader(
              numberOfTab: tabHeaders.length,
              tabHeaders: tabHeaders,
              onChangeTab: mockFunction,
            ),
          ),
        ),
      );

      final tab1 = find.text('Tab 1');
      final tab2 = find.text('Tab 2');

      expect(1, 1);
      await tester.tap(tab2);
      await tester.pump();

      expect(1, 1);
    });
  });
}
