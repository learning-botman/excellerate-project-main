import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../services/dummy_data_service.dart';
import '../models/user_stats.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userStats = DummyDataService.getUserStats();
    final activityHistory = DummyDataService.getActivityHistory();
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Learning Statistics',
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOverallProgress(context),
            _buildRecentActivity(context),
            _buildAchievements(context),
            _buildLearningStreak(context),
          ],
        ),
      ),
    );
  }

  Widget _buildOverallProgress(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Overall Progress',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildProgressItem(
                  context,
                  'Courses\nCompleted',
                  '3',
                  Colors.green,
                ),
                _buildProgressItem(
                  context,
                  'Hours\nLearned',
                  '42',
                  Colors.blue,
                ),
                _buildProgressItem(
                  context,
                  'Average\nScore',
                  '92%',
                  Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivity(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recent Activity',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildActivityItem(
              'Completed Quiz: Flutter Basics',
              'Score: 95%',
              Icons.quiz,
              Colors.purple,
            ),
            _buildActivityItem(
              'Watched: State Management',
              'Duration: 45 minutes',
              Icons.play_circle,
              Colors.blue,
            ),
            _buildActivityItem(
              'Submitted Assignment',
              'UI Development - Module 3',
              Icons.assignment_turned_in,
              Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievements(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Achievements',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildAchievementBadge(
                  'Quick\nLearner',
                  Icons.speed,
                  Colors.amber,
                ),
                _buildAchievementBadge(
                  'Perfect\nScore',
                  Icons.grade,
                  Colors.orange,
                ),
                _buildAchievementBadge(
                  '7 Day\nStreak',
                  Icons.local_fire_department,
                  Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLearningStreak(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Learning Streak',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                7,
                (index) => _buildStreakDay(
                  'D${index + 1}',
                  index < 5,
                  index == 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressItem(
    BuildContext context,
    String label,
    String value,
    Color color,
  ) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(
    String title,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
    );
  }

  Widget _buildAchievementBadge(
    String label,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 32),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildStreakDay(String day, bool completed, bool isToday) {
    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: completed
                ? Colors.green.withOpacity(0.1)
                : Colors.grey.withOpacity(0.1),
            shape: BoxShape.circle,
            border: isToday
                ? Border.all(color: Colors.green, width: 2)
                : null,
          ),
          child: Icon(
            completed ? Icons.check : Icons.circle,
            color: completed ? Colors.green : Colors.grey,
            size: 20,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          day,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}