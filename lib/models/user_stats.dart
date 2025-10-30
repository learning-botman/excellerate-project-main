import 'package:flutter/material.dart';

class UserStats {
  final int coursesCompleted;
  final int hoursLearned;
  final double averageScore;
  final int currentStreak;
  final int totalAssignments;
  final int assignmentsCompleted;
  final List<Achievement> achievements;
  final List<CourseProgress> inProgress;

  UserStats({
    required this.coursesCompleted,
    required this.hoursLearned,
    required this.averageScore,
    required this.currentStreak,
    required this.totalAssignments,
    required this.assignmentsCompleted,
    required this.achievements,
    required this.inProgress,
  });
}

class Achievement {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final DateTime earnedDate;

  Achievement({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.earnedDate,
  });
}

class CourseProgress {
  final String courseId;
  final String title;
  final double progress;
  final String lastActivity;
  final DateTime lastAccessDate;
  final List<ModuleProgress> modules;

  CourseProgress({
    required this.courseId,
    required this.title,
    required this.progress,
    required this.lastActivity,
    required this.lastAccessDate,
    required this.modules,
  });
}

class ModuleProgress {
  final String moduleId;
  final String title;
  final bool isCompleted;
  final double progress;
  final List<String> completedItems;

  ModuleProgress({
    required this.moduleId,
    required this.title,
    required this.isCompleted,
    required this.progress,
    required this.completedItems,
  });
}