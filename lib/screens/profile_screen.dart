import 'package:flutter/material.dart';
import '../models/student.dart';
import '../widgets/info_row.dart';
import '../widgets/student_header_card.dart';

class ProfileScreen extends StatelessWidget {
  final Student student;

  const ProfileScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
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
            child: StudentHeaderCard(student: student),
          ),
          const SizedBox(height: 16),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6),
              ],
            ),
            child: Column(
              children: [
                InfoRow(icon: Icons.person, label: 'Name', value: student.name),
                const Divider(height: 1),
                InfoRow(icon: Icons.badge, label: 'Student ID', value: student.studentId),
                const Divider(height: 1),
                InfoRow(icon: Icons.school, label: 'Organization', value: student.organization),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
