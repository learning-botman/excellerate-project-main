import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../services/dummy_data_service.dart';
import '../models/user_stats.dart';

class AchievementsScreen extends StatefulWidget {
  const AchievementsScreen({super.key});

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late UserStats userStats;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    userStats = DummyDataService.getUserStats();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Achievements',
        centerTitle: false,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Earned'),
            Tab(text: 'Available'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildEarnedAchievements(),
          _buildAvailableAchievements(),
        ],
      ),
    );
  }

  Widget _buildEarnedAchievements() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: userStats.achievements.length,
      itemBuilder: (context, index) {
        final achievement = userStats.achievements[index];
        return _buildAchievementCard(achievement);
      },
    );
  }

  Widget _buildAvailableAchievements() {
    // Dummy list of available achievements
    final availableAchievements = [
      Achievement(
        id: '6',
        title: 'Master Coder',
        description: 'Complete all courses in a learning path',
        icon: Icons.code,
        color: Colors.purple,
        earnedDate: DateTime.now(),
      ),
      Achievement(
        id: '7',
        title: 'Social Butterfly',
        description: 'Participate in 5 community discussions',
        icon: Icons.people,
        color: Colors.teal,
        earnedDate: DateTime.now(),
      ),
      Achievement(
        id: '8',
        title: 'Weekend Warrior',
        description: 'Study for 4 hours on a weekend',
        icon: Icons.weekend,
        color: Colors.brown,
        earnedDate: DateTime.now(),
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: availableAchievements.length,
      itemBuilder: (context, index) {
        final achievement = availableAchievements[index];
        return _buildAchievementCard(achievement, isLocked: true);
      },
    );
  }

  Widget _buildAchievementCard(Achievement achievement, {bool isLocked = false}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isLocked
                ? Colors.grey.withOpacity(0.1)
                : achievement.color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            achievement.icon,
            color: isLocked ? Colors.grey : achievement.color,
          ),
        ),
        title: Text(
          achievement.title,
          style: TextStyle(
            color: isLocked ? Colors.grey : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(achievement.description),
            if (!isLocked) ...[
              const SizedBox(height: 4),
              Text(
                'Earned ${_formatDate(achievement.earnedDate)}',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ],
        ),
        trailing: isLocked
            ? const Icon(Icons.lock, color: Colors.grey)
            : IconButton(
                icon: const Icon(Icons.share, color: Colors.blue),
                onPressed: () {
                  // TODO: Implement share functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Sharing "${achievement.title}" achievement'),
                    ),
                  );
                },
              ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}