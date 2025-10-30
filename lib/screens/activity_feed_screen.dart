import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../services/dummy_data_service.dart';

class ActivityFeedScreen extends StatelessWidget {
  const ActivityFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = DummyDataService.getActivityHistory();

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Activity Feed',
        centerTitle: false,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: activities.length,
        itemBuilder: (context, index) {
          final activity = activities[index];
          return _buildActivityCard(context, activity);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Implement activity filter
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Filter options coming soon!'),
            ),
          );
        },
        icon: const Icon(Icons.filter_list),
        label: const Text('Filter'),
      ),
    );
  }

  Widget _buildActivityCard(BuildContext context, Map<String, dynamic> activity) {
    final IconData icon;
    final Color color;
    final String verb;

    switch (activity['type']) {
      case 'quiz':
        icon = Icons.quiz;
        color = Colors.blue;
        verb = 'Completed';
        break;
      case 'video':
        icon = Icons.play_circle;
        color = Colors.red;
        verb = 'Watched';
        break;
      case 'assignment':
        icon = Icons.assignment;
        color = Colors.green;
        verb = 'Submitted';
        break;
      case 'reading':
        icon = Icons.book;
        color = Colors.orange;
        verb = 'Read';
        break;
      default:
        icon = Icons.school;
        color = Colors.purple;
        verb = 'Completed';
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color),
            ),
            title: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: '$verb ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: activity['title']),
                ],
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  activity['details'],
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Course: ${activity['course']}',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            trailing: Text(
              _formatTimestamp(activity['date'] as DateTime),
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ),
          const Divider(height: 0),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: () {
                  // TODO: Implement share functionality
                },
                icon: const Icon(Icons.share),
                label: const Text('Share'),
              ),
              TextButton.icon(
                onPressed: () {
                  // TODO: Implement view details functionality
                },
                icon: const Icon(Icons.visibility),
                label: const Text('View Details'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}