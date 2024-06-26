import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:seedflowhub/main.dart';
import 'package:seedflowhub/pages/onbording_page.dart';

void main() {
  testWidgets('App initialization test', (WidgetTester tester) async {
    // Initialize Firebase for testing
    await Firebase.initializeApp();

    // Build the widget tree
    await tester.pumpWidget(const MainApp());

    // Verify that the app initializes without errors
    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('App theme test', (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(const MainApp());

    // Verify that the app uses the specified theme
    final MaterialApp app = find.byType(MaterialApp).evaluate().first.widget as MaterialApp;
    expect(app.theme!.colorScheme.primary, Colors.green); // Assuming you want to test primary color
  });

  testWidgets('App home page test', (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(const MainApp());

    // Verify that the app's home page is the OnboardingPage
    expect(find.byType(OnboardingPage), findsOneWidget);
  });

  // You can add more tests as needed to cover additional functionality
}
