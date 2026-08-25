import 'package:flutter/material.dart';
import '../data/courses.dart';
import '../widgets/course_card.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return CourseCard(course: courses[index]);
      },
    );
  }
}
