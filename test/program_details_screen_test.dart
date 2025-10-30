import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:excellerate/screens/program_details_screen.dart';
import 'package:excellerate/models/program.dart';
import 'package:excellerate/screens/feedback_screen.dart';
import 'package:excellerate/widgets/enrollment_button.dart';

void main() {
  testWidgets('ProgramDetailsScreen displays program information correctly',
      (WidgetTester tester) async {
    final program = Program(
      id: 'test-program',
      title: 'Test Program',
      description: 'Test Description',
      instructor: 'Test Instructor',
      duration: '8 weeks',
      level: 'Intermediate',
      topics: ['Topic 1', 'Topic 2'],
      imageUrl: 'assets/images/test.png',
      rating: 4.5,
      enrolledCount: 100,
      lastUpdated: '2025-10-30',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: ProgramDetailsScreen(),
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => ProgramDetailsScreen(),
            settings: RouteSettings(arguments: program),
          );
        },
      ),
    );

    // Verify program title is displayed
    expect(find.text('Test Program'), findsOneWidget);
    
    // Verify instructor name is displayed
    expect(find.text('by Test Instructor'), findsOneWidget);
    
    // Verify program description is displayed
    expect(find.text('Test Description'), findsOneWidget);
    
    // Verify stats are displayed
    expect(find.text('4.5'), findsOneWidget);
    expect(find.text('100'), findsOneWidget);
    expect(find.text('8 weeks'), findsOneWidget);
    expect(find.text('Intermediate'), findsOneWidget);
    
    // Verify topics are displayed
    expect(find.text('Topic 1'), findsOneWidget);
    expect(find.text('Topic 2'), findsOneWidget);
    
    // Verify buttons are present
    expect(find.text('Enroll Now'), findsOneWidget);
    expect(find.text('Give Feedback'), findsOneWidget);
  });

  testWidgets('ProgramDetailsScreen handles missing program data gracefully',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ProgramDetailsScreen(),
      ),
    );

    // Verify fallback values are displayed
    expect(find.text('Program Not Found'), findsOneWidget);
    expect(find.text('Program details are not available.'), findsOneWidget);
    expect(find.text('by Unknown'), findsOneWidget);
  });

  testWidgets('ProgramDetailsScreen buttons trigger correct actions',
      (WidgetTester tester) async {
    final program = Program(
      id: 'test-program',
      title: 'Test Program',
      description: 'Test Description',
      instructor: 'Test Instructor',
      duration: '8 weeks',
      level: 'Intermediate',
      topics: ['Topic 1', 'Topic 2'],
      imageUrl: 'assets/images/test.png',
      rating: 4.5,
      enrolledCount: 100,
      lastUpdated: '2025-10-30',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: ProgramDetailsScreen(),
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => ProgramDetailsScreen(),
            settings: RouteSettings(arguments: program),
          );
        },
      ),
    );

    // Test Enroll Now button
    await tester.tap(find.text('Enroll Now'));
    await tester.pump();
    expect(find.text('Enrollment coming soon!'), findsOneWidget);

    // Test Give Feedback button navigation
    await tester.tap(find.text('Give Feedback'));
    await tester.pumpAndSettle();
    expect(find.byType(Navigator), findsOneWidget);
  });
}