import 'package:flutter/material.dart';
import '../models/user_stats.dart';

class DummyDataService {
  static UserStats getUserStats() {
    return UserStats(
      coursesCompleted: 3,
      hoursLearned: 42,
      averageScore: 92.5,
      currentStreak: 7,
      totalAssignments: 15,
      assignmentsCompleted: 12,
      achievements: [
        Achievement(
          id: '1',
          title: 'Quick Learner',
          description: 'Complete 3 lessons in one day',
          icon: Icons.speed,
          color: Colors.blue,
          earnedDate: DateTime.now().subtract(const Duration(days: 2)),
        ),
        Achievement(
          id: '2',
          title: 'Perfect Score',
          description: 'Get 100% on a quiz',
          icon: Icons.grade,
          color: Colors.amber,
          earnedDate: DateTime.now().subtract(const Duration(days: 5)),
        ),
        Achievement(
          id: '3',
          title: 'Early Bird',
          description: 'Complete a lesson before 8 AM',
          icon: Icons.wb_sunny,
          color: Colors.orange,
          earnedDate: DateTime.now().subtract(const Duration(days: 7)),
        ),
        Achievement(
          id: '4',
          title: 'Night Owl',
          description: 'Study for 2 hours after 10 PM',
          icon: Icons.nightlight_round,
          color: Colors.indigo,
          earnedDate: DateTime.now().subtract(const Duration(days: 10)),
        ),
        Achievement(
          id: '5',
          title: 'Consistent Learner',
          description: 'Maintain a 7-day streak',
          icon: Icons.local_fire_department,
          color: Colors.red,
          earnedDate: DateTime.now().subtract(const Duration(days: 1)),
        ),
      ],
      inProgress: [
        CourseProgress(
          courseId: '1',
          title: 'Flutter UI Development',
          progress: 0.75,
          lastActivity: 'Completed Module 3: Advanced Layouts',
          lastAccessDate: DateTime.now().subtract(const Duration(hours: 2)),
          modules: [
            ModuleProgress(
              moduleId: 'm1',
              title: 'Basic Widgets',
              isCompleted: true,
              progress: 1.0,
              completedItems: ['Quiz', 'Assignment', 'Practice'],
            ),
            ModuleProgress(
              moduleId: 'm2',
              title: 'Layouts and Navigation',
              isCompleted: true,
              progress: 1.0,
              completedItems: ['Quiz', 'Assignment'],
            ),
            ModuleProgress(
              moduleId: 'm3',
              title: 'Advanced Layouts',
              isCompleted: true,
              progress: 1.0,
              completedItems: ['Quiz'],
            ),
            ModuleProgress(
              moduleId: 'm4',
              title: 'Animations and Gestures',
              isCompleted: false,
              progress: 0.3,
              completedItems: ['Introduction'],
            ),
          ],
        ),
        CourseProgress(
          courseId: '2',
          title: 'State Management with Provider',
          progress: 0.45,
          lastActivity: 'Started Module 2: Complex State Patterns',
          lastAccessDate: DateTime.now().subtract(const Duration(days: 1)),
          modules: [
            ModuleProgress(
              moduleId: 'm1',
              title: 'Introduction to Provider',
              isCompleted: true,
              progress: 1.0,
              completedItems: ['Quiz', 'Assignment'],
            ),
            ModuleProgress(
              moduleId: 'm2',
              title: 'Complex State Patterns',
              isCompleted: false,
              progress: 0.5,
              completedItems: ['Lesson 1', 'Quiz 1'],
            ),
          ],
        ),
        CourseProgress(
          courseId: '3',
          title: 'Firebase Integration',
          progress: 0.25,
          lastActivity: 'Completed Module 1: Setup and Configuration',
          lastAccessDate: DateTime.now().subtract(const Duration(days: 2)),
          modules: [
            ModuleProgress(
              moduleId: 'm1',
              title: 'Setup and Configuration',
              isCompleted: true,
              progress: 1.0,
              completedItems: ['Setup Guide', 'Configuration Test'],
            ),
            ModuleProgress(
              moduleId: 'm2',
              title: 'Authentication',
              isCompleted: false,
              progress: 0.2,
              completedItems: ['Introduction'],
            ),
          ],
        ),
      ],
    );
  }

  static List<Map<String, dynamic>> getNotifications() {
    return [
      {
        'id': '1',
        'title': 'Assignment Due Tomorrow',
        'message': 'Flutter UI Development - Module 4 assignment is due tomorrow at 11:59 PM',
        'type': 'assignment',
        'priority': 'high',
        'time': DateTime.now().subtract(const Duration(hours: 2)),
        'isRead': false,
      },
      {
        'id': '2',
        'title': 'New Course Available',
        'message': 'Advanced State Management with Riverpod is now available',
        'type': 'course',
        'priority': 'medium',
        'time': DateTime.now().subtract(const Duration(hours: 5)),
        'isRead': true,
      },
      {
        'id': '3',
        'title': 'Achievement Unlocked',
        'message': 'Congratulations! You\'ve earned the "Consistent Learner" badge',
        'type': 'achievement',
        'priority': 'low',
        'time': DateTime.now().subtract(const Duration(days: 1)),
        'isRead': true,
      },
      {
        'id': '4',
        'title': 'Live Session Reminder',
        'message': 'Don\'t miss the live Q&A session on Advanced Animations tomorrow at 2 PM',
        'type': 'event',
        'priority': 'medium',
        'time': DateTime.now().subtract(const Duration(days: 1)),
        'isRead': false,
      },
      {
        'id': '5',
        'title': 'Course Update',
        'message': 'New content added to Firebase Integration course',
        'type': 'update',
        'priority': 'low',
        'time': DateTime.now().subtract(const Duration(days: 2)),
        'isRead': false,
      },
    ];
  }

  static Map<String, dynamic> getLearningPreferences() {
    return {
      'studyPreferences': {
        'preferredLanguage': 'English',
        'difficultyLevel': 'Intermediate',
        'dailyGoal': '2 hours',
        'preferredStudyTime': 'Evening',
      },
      'contentSettings': {
        'autoPlayVideos': true,
        'downloadOverWifi': true,
        'textSize': 'Medium',
        'themeMode': 'System',
      },
      'notificationPreferences': {
        'emailNotifications': true,
        'pushNotifications': true,
        'reminderFrequency': 'Daily',
        'quietHours': {
          'enabled': true,
          'start': '22:00',
          'end': '07:00',
        },
      },
      'accessibility': {
        'screenReader': false,
        'highContrast': false,
        'reducedMotion': false,
        'closedCaptions': true,
      },
    };
  }

  
    // Add activity history data
    static List<Map<String, dynamic>> getActivityHistory() {
      final now = DateTime.now();
      return [
        {
          'type': 'quiz',
          'title': 'Module 1 Assessment',
          'details': 'Score: 95% - Great work!',
          'course': 'Introduction to Flutter',
          'date': now.subtract(const Duration(minutes: 30)),
        },
        {
          'type': 'video',
          'title': 'State Management in Flutter',
          'details': 'Duration: 45 minutes',
          'course': 'Advanced Flutter Development',
          'date': now.subtract(const Duration(hours: 2)),
        },
        {
          'type': 'assignment',
          'title': 'Build a Simple Weather App',
          'details': 'Project submitted successfully',
          'course': 'Mobile App Development',
          'date': now.subtract(const Duration(hours: 5)),
        },
        {
          'type': 'reading',
          'title': 'Flutter Architecture Best Practices',
          'details': 'Completed chapter 3 of 5',
          'course': 'Flutter Development Patterns',
          'date': now.subtract(const Duration(hours: 8)),
        },
        {
          'type': 'quiz',
          'title': 'Final Assessment',
          'details': 'Score: 88% - Well done!',
          'course': 'Dart Programming Basics',
          'date': now.subtract(const Duration(days: 1)),
        },
        {
          'type': 'assignment',
          'title': 'Create a Social Media App UI',
          'details': 'Project received high marks',
          'course': 'UI/UX Design with Flutter',
          'date': now.subtract(const Duration(days: 2)),
        },
        {
          'type': 'video',
          'title': 'Firebase Integration',
          'details': 'Duration: 60 minutes',
          'course': 'Backend Integration',
          'date': now.subtract(const Duration(days: 3)),
        },
        {
          'type': 'reading',
          'title': 'Mobile App Security Guidelines',
          'details': 'Completed all chapters',
          'course': 'App Security Fundamentals',
          'date': now.subtract(const Duration(days: 4)),
        },
      ];
    }
}