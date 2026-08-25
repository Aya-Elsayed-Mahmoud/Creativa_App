import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;

  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon, color: AppColors.primary),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}
