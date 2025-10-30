// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:excellerate/main.dart';

void main() {
  testWidgets('App shows login screen with signup link', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify Login screen content is present.
    expect(find.text('Welcome to Excellerate'), findsOneWidget);
    expect(find.text('Sign in to continue'), findsOneWidget);
    expect(find.text('Don\'t have an account? Sign Up'), findsOneWidget);
  });

  testWidgets('Can navigate to signup screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Tap the signup link
    await tester.tap(find.text('Don\'t have an account? Sign Up'));
    await tester.pumpAndSettle();

    // Verify Signup screen content is present
    expect(find.text('Create Account'), findsOneWidget);
    expect(find.text('Already have an account? Sign In'), findsOneWidget);
  });

  testWidgets('Signup form shows validation errors', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Navigate to signup
    await tester.tap(find.text('Don\'t have an account? Sign Up'));
    await tester.pumpAndSettle();

    // Try to signup without filling form
    await tester.tap(find.text('Sign Up'));
    await tester.pump();

    // Verify validation errors appear
    expect(find.text('Email is required'), findsOneWidget);
    expect(find.text('Password is required'), findsOneWidget);
    expect(find.text('Please confirm your password'), findsOneWidget);
  });
}
