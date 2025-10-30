import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Notifications',
        centerTitle: false,
      ),
      body: ListView(
        children: [
          _buildNotificationGroup(
            'Today',
            [
              _NotificationItem(
                title: 'Assignment Due Tomorrow',
                message: 'Flutter UI Development - Module 3 assignment is due tomorrow',
                time: '2 hours ago',
                icon: Icons.assignment_late,
                color: Colors.orange,
              ),
              _NotificationItem(
                title: 'New Course Available',
                message: 'Advanced Mobile App Development with Flutter is now available',
                time: '5 hours ago',
                icon: Icons.school,
                color: Colors.green,
              ),
            ],
          ),
          _buildNotificationGroup(
            'Yesterday',
            [
              _NotificationItem(
                title: 'Assignment Graded',
                message: 'You received 95% on Flutter Basics Quiz',
                time: '1 day ago',
                icon: Icons.grade,
                color: Colors.amber,
              ),
              _NotificationItem(
                title: 'Live Session Reminder',
                message: 'Join the live Q&A session on State Management',
                time: '1 day ago',
                icon: Icons.live_tv,
                color: Colors.red,
              ),
            ],
          ),
          _buildNotificationGroup(
            'This Week',
            [
              _NotificationItem(
                title: 'Course Completion',
                message: 'Congratulations! You completed Dart Basics',
                time: '3 days ago',
                icon: Icons.celebration,
                color: Colors.purple,
              ),
              _NotificationItem(
                title: 'New Achievement',
                message: 'You earned the "Quick Learner" badge',
                time: '5 days ago',
                icon: Icons.emoji_events,
                color: Colors.amber,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationGroup(String title, List<_NotificationItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        ...items,
      ],
    );
  }
}

class _NotificationItem extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  final IconData icon;
  final Color color;

  const _NotificationItem({
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(message),
            const SizedBox(height: 4),
            Text(
              time,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ],
        ),
        isThreeLine: true,
        onTap: () {
          // TODO: Handle notification tap
        },
      ),
    );
  }
}