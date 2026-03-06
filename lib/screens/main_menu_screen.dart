import 'package:flutter/material.dart';
import 'package:sky_barrage/routes/custom_routes.dart';
import 'package:sky_barrage/screens/gameplay_screen.dart';
import 'package:sky_barrage/screens/settings_screen.dart';
import 'package:sky_barrage/screens/leaderboard_screen.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Game Title
              const Text(
                'Sky Barrage',
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 4.0,
                  shadows: [
                    Shadow(
                      color: Colors.blueAccent,
                      blurRadius: 10.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),

              // Start Game Button
              _MenuButton(
                title: '▶ Start Game',
                onPressed: () {
                  Navigator.of(context).push(
                    FadePageRoute(page: const GameplayScreen()),
                  );
                },
              ),
              const SizedBox(height: 20),

              // Settings Button
              _MenuButton(
                title: '⚙ Settings',
                onPressed: () {
                  Navigator.of(context).push(
                    FadePageRoute(page: const SettingsScreen()),
                  );
                },
                isSecondary: true,
              ),
              const SizedBox(height: 20),

              // Leaderboard Button
              _MenuButton(
                title: '🏆 Leaderboard',
                onPressed: () {
                  Navigator.of(context).push(
                    FadePageRoute(page: const LeaderboardScreen()),
                  );
                },
                isSecondary: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isSecondary;

  const _MenuButton({
    required this.title,
    required this.onPressed,
    this.isSecondary = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSecondary 
              ? Colors.transparent 
              : Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          side: isSecondary 
              ? BorderSide(color: Theme.of(context).primaryColor, width: 2)
              : BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: isSecondary ? 0 : 8,
          shadowColor: Theme.of(context).primaryColor.withOpacity(0.5),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}
