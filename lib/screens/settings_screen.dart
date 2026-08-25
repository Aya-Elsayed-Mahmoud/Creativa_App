import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;
  bool _notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SwitchListTile(
            secondary: const Icon(Icons.dark_mode_outlined, color: AppColors.primary),
            title: const Text('Dark Mode'),
            subtitle: const Text('Enable dark theme (demo only)'),
            value: _darkMode,
            onChanged: (value) => setState(() => _darkMode = value),
          ),
          const Divider(height: 1),
          SwitchListTile(
            secondary: const Icon(Icons.notifications_outlined, color: AppColors.primary),
            title: const Text('Notifications'),
            subtitle: const Text('Receive updates from the training center'),
            value: _notifications,
            onChanged: (value) => setState(() => _notifications = value),
          ),
        ],
      ),
    );
  }
}
