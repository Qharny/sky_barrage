import 'package:flutter/material.dart';
import 'package:sky_barrage/screens/main_menu_screen.dart';
import 'package:sky_barrage/routes/custom_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMainMenu();
  }

  Future<void> _navigateToMainMenu() async {
    // Simulate background loading/delay for 3 seconds
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    Navigator.of(context).pushReplacement(
      FadePageRoute(page: const MainMenuScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // A dark background fits arcade games well
      backgroundColor: const Color(0xFF0F172A), // Dark slate
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Game Logo
            Image.asset(
              'assets/images/logo.png',
              width: 150,
              height: 150,
              // In case the image takes a moment to load
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.airplanemode_active,
                color: Colors.white,
                size: 100,
              ),
            ),
            const SizedBox(height: 24),
            
            // Game Title
            const Text(
              'Sky Barrage',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 48),

            // Loading Indicator and Text
            const CircularProgressIndicator(
              color: Colors.blueAccent,
            ),
            const SizedBox(height: 16),
            const Text(
              'Loading...',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
