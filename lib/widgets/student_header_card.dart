import 'package:flutter/material.dart';
import '../models/student.dart';
import '../theme/app_colors.dart';

class StudentHeaderCard extends StatelessWidget {
  final Student student;
  final bool showGreeting;

  const StudentHeaderCard({
    super.key,
    required this.student,
    this.showGreeting = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 26,
          backgroundColor: AppColors.primary,
          child: Icon(Icons.person, color: Colors.white),
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              showGreeting ? 'Hello, ${student.name}!' : student.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              'Student ID: ${student.studentId}',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
            ),
          ],
        ),
      ],
    );
  }
}
