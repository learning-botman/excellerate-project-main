import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class LearningPreferencesScreen extends StatefulWidget {
  const LearningPreferencesScreen({super.key});

  @override
  State<LearningPreferencesScreen> createState() => _LearningPreferencesScreenState();
}

class _LearningPreferencesScreenState extends State<LearningPreferencesScreen> {
  bool _emailNotifications = true;
  bool _pushNotifications = true;
  String _preferredLanguage = 'English';
  String _difficultyLevel = 'Intermediate';
  bool _autoPlayVideos = true;
  bool _downloadOverWifi = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Learning Preferences',
        centerTitle: false,
      ),
      body: ListView(
        children: [
          _buildSection(
            title: 'Study Preferences',
            children: [
              ListTile(
                title: const Text('Preferred Language'),
                subtitle: Text(_preferredLanguage),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // TODO: Show language selection dialog
                },
              ),
              ListTile(
                title: const Text('Difficulty Level'),
                subtitle: Text(_difficultyLevel),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // TODO: Show difficulty selection dialog
                },
              ),
            ],
          ),
          _buildSection(
            title: 'Content Settings',
            children: [
              SwitchListTile(
                title: const Text('Auto-play Videos'),
                subtitle: const Text('Play videos automatically when ready'),
                value: _autoPlayVideos,
                onChanged: (value) {
                  setState(() {
                    _autoPlayVideos = value;
                  });
                },
              ),
              SwitchListTile(
                title: const Text('Download over Wi-Fi only'),
                subtitle: const Text('Save mobile data by downloading on Wi-Fi'),
                value: _downloadOverWifi,
                onChanged: (value) {
                  setState(() {
                    _downloadOverWifi = value;
                  });
                },
              ),
            ],
          ),
          _buildSection(
            title: 'Notification Preferences',
            children: [
              SwitchListTile(
                title: const Text('Email Notifications'),
                subtitle: const Text('Receive course updates via email'),
                value: _emailNotifications,
                onChanged: (value) {
                  setState(() {
                    _emailNotifications = value;
                  });
                },
              ),
              SwitchListTile(
                title: const Text('Push Notifications'),
                subtitle: const Text('Receive instant updates on your device'),
                value: _pushNotifications,
                onChanged: (value) {
                  setState(() {
                    _pushNotifications = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
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
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}