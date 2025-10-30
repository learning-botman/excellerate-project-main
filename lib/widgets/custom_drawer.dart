import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(-3, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 20,
              bottom: 20,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const Text(
                  'Excellerate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Learning Platform',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          _buildMenuItem(
            context,
            icon: Icons.home_outlined,
            title: 'Home',
            route: '/home',
          ),
          _buildMenuItem(
            context,
            icon: Icons.school_outlined,
            title: 'Programs',
            route: '/program_listing',
          ),
          _buildMenuItem(
            context,
            icon: Icons.bookmark_outline,
            title: 'My Programs',
            route: '/my_programs',
          ),
          _buildMenuItem(
            context,
            icon: Icons.assignment_outlined,
            title: 'Assignments',
            route: '/assignments',
          ),
          _buildMenuItem(
            context,
            icon: Icons.people_outline,
            title: 'Community',
            route: '/community',
          ),
          _buildMenuItem(
            context,
            icon: Icons.analytics_outlined,
            title: 'Progress',
            route: '/progress',
          ),
          const Spacer(),
          const Divider(),
          _buildMenuItem(
            context,
            icon: Icons.settings_outlined,
            title: 'Settings',
            route: '/settings',
          ),
          _buildMenuItem(
            context,
            icon: Icons.exit_to_app,
            title: 'Logout',
            route: '/login',
            onTap: () {
              // TODO: Implement logout logic
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String route,
    VoidCallback? onTap,
  }) {
    final isCurrentRoute = ModalRoute.of(context)?.settings.name == route;
    return ListTile(
      leading: Icon(
        icon,
        color: isCurrentRoute
            ? Theme.of(context).colorScheme.primary
            : Colors.grey[600],
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isCurrentRoute
              ? Theme.of(context).colorScheme.primary
              : Colors.grey[800],
          fontWeight: isCurrentRoute ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: onTap ??
          () {
            Navigator.pushReplacementNamed(context, route);
          },
      selected: isCurrentRoute,
      selectedTileColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}