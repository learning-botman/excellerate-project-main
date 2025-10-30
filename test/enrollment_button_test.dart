import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:excellerate/widgets/enrollment_button.dart';
import 'package:excellerate/models/program.dart';

void main() {
  final testProgram = Program(
    id: 'test-1',
    title: 'Test Program',
    description: 'Test Description',
    instructor: 'Test Instructor',
    duration: '8 weeks',
    level: 'Beginner',
    topics: ['Topic 1', 'Topic 2'],
    imageUrl: 'test.jpg',
    rating: 4.5,
    enrolledCount: 100,
    lastUpdated: '2025-10-30',
  );

  testWidgets('EnrollmentButton shows loading state during enrollment',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EnrollmentButton(program: testProgram),
        ),
      ),
    );

    // Verify initial state
    expect(find.text('Enroll Now'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);

    // Tap the button
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify loading state
    expect(find.text('Enroll Now'), findsNothing);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Wait for enrollment to complete
    await tester.pump(const Duration(seconds: 2));

    // Verify button returns to initial state
    expect(find.text('Enroll Now'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('EnrollmentButton shows success message after enrollment',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EnrollmentButton(program: testProgram),
        ),
      ),
    );

    // Tap the button
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Wait for enrollment to complete
    await tester.pump(const Duration(seconds: 2));

    // Verify success message
    expect(find.text('Successfully enrolled in Test Program!'), findsOneWidget);
  });
}