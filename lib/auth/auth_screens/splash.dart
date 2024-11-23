import 'package:flutter/material.dart';
import 'package:gate_app1/auth/auth_screens/login.dart';
import 'package:gate_app1/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    // Simulate a delay (e.g., for loading resources or checking authentication)
    await Future.delayed(const Duration(seconds: 3));

    // Navigate to the Login Screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.secondary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Name or Tagline
            Text(
              'GATE APP',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: AppColors.background,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Managing activities efficiently',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.background,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
