import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/registration_screen.dart';
import 'theme/app_colors.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const CreativaApp());
}

class CreativaApp extends StatelessWidget {
  const CreativaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Creativa App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: const RegistrationScreen(),
    );
  }
}
