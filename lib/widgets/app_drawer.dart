import 'package:flutter/material.dart';
import '../models/student.dart';
import '../theme/app_colors.dart';
import 'logout_dialog.dart';

class AppDrawer extends StatelessWidget {
  final Student student;
  final VoidCallback onHomeTap;
  final VoidCallback onProfileTap;
  final VoidCallback onCoursesTap;
  final VoidCallback onAboutTap;
  final VoidCallback onSettingsTap;
  final VoidCallback onLogout;

  const AppDrawer({
    super.key,
    required this.student,
    required this.onHomeTap,
    required this.onProfileTap,
    required this.onCoursesTap,
    required this.onAboutTap,
    required this.onSettingsTap,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
            color: AppColors.primary,
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: AppColors.primary),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      student.name,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      'ID: ${student.studentId}',
                      style: const TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home, color: AppColors.primary),
            title: const Text('Home'),
            onTap: onHomeTap,
          ),
          ListTile(
            leading: const Icon(Icons.person, color: AppColors.primary),
            title: const Text('Profile'),
            onTap: onProfileTap,
          ),
          ListTile(
            leading: const Icon(Icons.school, color: AppColors.primary),
            title: const Text('Courses'),
            onTap: onCoursesTap,
          ),
          ListTile(
            leading: const Icon(Icons.info, color: AppColors.primary),
            title: const Text('About'),
            onTap: onAboutTap,
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: AppColors.primary),
            title: const Text('Settings'),
            onTap: onSettingsTap,
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () async {
              final confirmed = await showLogoutDialog(context);
              if (confirmed) onLogout();
            },
          ),
        ],
      ),
    );
  }
}
