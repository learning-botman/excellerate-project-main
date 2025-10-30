import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/custom_app_bar.dart';
import 'notifications_screen.dart';
import 'learning_preferences_screen.dart';
import 'statistics_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomAppBar(
        title: 'Profile',
        centerTitle: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildProfileHeader(context),
              const SizedBox(height: 20),
              _buildStatsSection(context),
              const SizedBox(height: 20),
              _buildMenuSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white24,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'John Doe',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'john.doe@example.com',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () {
              // TODO: Implement edit profile
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('Edit Profile'),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _buildStatCard(
            context,
            'Programs\nEnrolled',
            '5',
            Icons.school,
          ),
          const SizedBox(width: 16),
          _buildStatCard(
            context,
            'Assignments\nCompleted',
            '12',
            Icons.assignment_turned_in,
          ),
          const SizedBox(width: 16),
          _buildStatCard(
            context,
            'Average\nScore',
            '92%',
            Icons.star,
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const StatisticsScreen(),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Icon(icon, color: Colors.white, size: 24),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          _buildMenuItem(
            context,
            title: 'Personal Information',
            icon: Icons.person_outline,
            onTap: () {
              // TODO: Navigate to personal info screen
            },
          ),
          _buildMenuItem(
            context,
            title: 'Notifications',
            icon: Icons.notifications_outlined,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationsScreen(),
                ),
              );
            },
          ),
          _buildMenuItem(
            context,
            title: 'Learning Preferences',
            icon: Icons.school_outlined,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LearningPreferencesScreen(),
                ),
              );
            },
          ),
          _buildMenuItem(
            context,
            title: 'Payment Methods',
            icon: Icons.payment_outlined,
            onTap: () {
              // TODO: Navigate to payment methods
            },
          ),
          _buildMenuItem(
            context,
            title: 'Help Center',
            icon: Icons.help_outline,
            onTap: () {
              // TODO: Navigate to help center
            },
          ),
          _buildMenuItem(
            context,
            title: 'Privacy & Security',
            icon: Icons.security_outlined,
            onTap: () {
              // TODO: Navigate to privacy settings
            },
          ),
          const Divider(),
          _buildMenuItem(
            context,
            title: 'Logout',
            icon: Icons.exit_to_app,
            color: Colors.red,
            onTap: () {
              // TODO: Implement logout
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    Color? color,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: color ?? Colors.grey[700],
      ),
      title: Text(
        title,
        style: TextStyle(
          color: color ?? Colors.grey[800],
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: color ?? Colors.grey[400],
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}