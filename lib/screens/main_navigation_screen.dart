import 'package:flutter/material.dart';
import '../models/student.dart';
import '../theme/app_colors.dart';
import '../widgets/app_drawer.dart';
import 'about_screen.dart';
import 'courses_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'registration_screen.dart';
import 'settings_screen.dart';


class MainNavigationScreen extends StatefulWidget {
  final Student student;

  final bool showRegisteredMessage;

  const MainNavigationScreen({
    super.key,
    required this.student,
    this.showRegisteredMessage = false,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    if (widget.showRegisteredMessage) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: AppColors.success,
            content: Text('Registration successful!'),
          ),
        );
      });
    }
  }

  void _openTab(int index) {
    Navigator.pop(context);
    setState(() => _currentIndex = index);
  }

  void _openScreen(Widget screen) {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  void _logout() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const RegistrationScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(student: widget.student),
      const CoursesScreen(),
      ProfileScreen(student: widget.student),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Creativa App'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      drawer: AppDrawer(
        student: widget.student,
        onHomeTap: () => _openTab(0),
        onCoursesTap: () => _openTab(1),
        onProfileTap: () => _openTab(2),
        onAboutTap: () => _openScreen(const AboutScreen()),
        onSettingsTap: () => _openScreen(const SettingsScreen()),
        onLogout: _logout,
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Courses'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
