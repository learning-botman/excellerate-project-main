import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:excellerate/screens/program_listing_screen.dart';
import 'package:excellerate/screens/program_details_screen.dart';
import 'package:excellerate/screens/feedback_screen.dart';
import 'package:excellerate/models/program.dart';

void main() {
  final testProgram = Program(
    id: 'test-1',
    title: 'Test Program',
    description: 'Test Description',
    instructor: 'Test Instructor',
    duration: '4 weeks',
    level: 'Beginner',
    topics: ['Topic 1', 'Topic 2'],
    imageUrl: 'test.png',
    rating: 4.5,
    enrolledCount: 100,
    lastUpdated: '2025-10-30',
  );

  testWidgets('ProgramListingScreen shows loading and then programs', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const ProgramListingScreen(),
        routes: {
          '/program_details': (context) => const ProgramDetailsScreen(),
        },
      ),
    );

    // Initially shows loading indicator
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Wait for programs to load
    await tester.pumpAndSettle();

    // Should show program cards
    expect(find.byType(Card), findsWidgets);
  });

  testWidgets('ProgramDetailsScreen shows program information', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => Navigator(
            onGenerateRoute: (_) => MaterialPageRoute<void>(
              builder: (context) => ProgramDetailsScreen(),
              settings: RouteSettings(arguments: testProgram),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Verify program details are shown
    expect(find.textContaining(testProgram.title), findsOneWidget);
    expect(find.textContaining(testProgram.instructor), findsOneWidget);
    expect(find.textContaining(testProgram.description), findsOneWidget);
  });

  testWidgets('FeedbackScreen validates input', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FeedbackScreen(program: testProgram),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Try to submit empty form
    await tester.tap(find.text('Submit Feedback'));
    await tester.pumpAndSettle();

    // Should show validation error
    expect(find.text('Please enter your feedback'), findsOneWidget);

    // Enter short feedback
    await tester.enterText(
      find.byType(TextFormField),
      'Short',
    );
    await tester.tap(find.text('Submit Feedback'));
    await tester.pumpAndSettle();

    // Should show length validation error
    expect(find.text('Feedback must be at least 10 characters long'), findsOneWidget);

    // Enter valid feedback
    await tester.enterText(
      find.byType(TextFormField),
      'This is a valid feedback message that is long enough.',
    );
    
    // Submit the form
    await tester.tap(find.text('Submit Feedback'));
    await tester.pump(); // Start the loading state

    // Verify loading state
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Complete the submission
    await tester.pumpAndSettle();

    // Should show success message
    expect(find.text('Thank you for your feedback!'), findsOneWidget);
  });
}