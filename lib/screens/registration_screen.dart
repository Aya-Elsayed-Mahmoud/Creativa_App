import 'package:flutter/material.dart';
import '../models/student.dart';
import '../services/firestore_service.dart';
import '../theme/app_colors.dart';
import '../widgets/app_text_field.dart';
import 'main_navigation_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _firestoreService = FirestoreService();

  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _idController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final name = _nameController.text.trim();
    final id = _idController.text.trim();

    if (name.isEmpty || id.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in both fields')),
      );
      return;
    }

    setState(() => _isLoading = true);

    final student = Student(name: name, studentId: id);

    try {
      await _firestoreService.registerStudent(student);

      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MainNavigationScreen(
            student: student,
            showRegisteredMessage: true,
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Something went wrong: $e')),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(flex: 3),
              const Text(
                'Creativa App',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 2),
                ),
                padding: const EdgeInsets.all(6),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: const Icon(Icons.school, color: Colors.white, size: 50),
                ),
              ),
              const Spacer(flex: 1),
              AppTextField(
                controller: _nameController,
                hintText: 'Name',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: _idController,
                hintText: 'Student ID',
                icon: Icons.badge_outlined,
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                      : const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}