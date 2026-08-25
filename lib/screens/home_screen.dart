import 'package:flutter/material.dart';
import '../models/student.dart';
import '../theme/app_colors.dart';
import '../widgets/student_header_card.dart';

class HomeScreen extends StatelessWidget {
  final Student student;

  const HomeScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome to Creativa App',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6),
              ],
            ),
            child: StudentHeaderCard(student: student, showGreeting: true),
          ),
          const SizedBox(height: 16),

          Text(
            'Use the menu or the bottom navigation bar to explore '
            'your courses, profile, and more.',
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
