import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seedflowhub/pages/home_page.dart';
import 'package:seedflowhub/pages/login_page.dart';
import 'package:seedflowhub/pages/signup_page.dart';

void main() {
  testWidgets('Login page UI test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    expect(find.text('Welcome Back'), findsOneWidget);
    expect(find.text('Enter your credentials to login'), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Forgot password?'), findsOneWidget);
    expect(find.text('Don\'t have an account?'), findsOneWidget);
    expect(find.text('Sign Up'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('Login with valid credentials', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    await tester.enterText(find.byType(TextField).first, 'test@example.com');
    await tester.enterText(find.byType(TextField).last, 'password');

    await tester.tap(find.text('Login'));
    await tester.pump();

    // You can expect that navigation occurs to the HomePage after successful login
    expect(find.byType(HomePage), findsOneWidget);
  });

  testWidgets('Navigation to signup page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    await tester.tap(find.text('Sign Up'));
    await tester.pumpAndSettle();

    // You can expect that navigation occurs to the SignupPage after tapping the Sign Up button
    expect(find.byType(SignupPage), findsOneWidget);
  });

  // Add more test cases as needed to cover all functionalities and edge cases
}
