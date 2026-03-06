import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:sky_barrage/game/sky_barrage_game.dart';
import 'package:sky_barrage/theme/app_theme.dart';

class GameplayScreen extends StatefulWidget {
  const GameplayScreen({super.key});

  @override
  State<GameplayScreen> createState() => _GameplayScreenState();
}

class _GameplayScreenState extends State<GameplayScreen> {
  late final SkyBarrageGame _game;

  @override
  void initState() {
    super.initState();
    _game = SkyBarrageGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // 1) The Flame Game Engine Layer
            GameWidget(
              game: _game,
              overlayBuilderMap: {
                'PauseMenu': (BuildContext context, SkyBarrageGame game) {
                  return _PauseMenuOverlay(game: game);
                },
                'GameOver': (BuildContext context, SkyBarrageGame game) {
                  return _GameOverOverlay(game: game);
                },
              },
            ),

            // 2) Top UI Layer (HUD)
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Score Display
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppTheme.primaryColor),
                    ),
                    child: Text(
                      'Score: ${_game.score}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Pause Button
                  IconButton(
                    icon: const Icon(Icons.pause, color: Colors.white, size: 32),
                    onPressed: () => _game.pauseGame(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PauseMenuOverlay extends StatelessWidget {
  final SkyBarrageGame game;

  const _PauseMenuOverlay({required this.game});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppTheme.surfaceColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppTheme.primaryColor, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 20,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            const Text(
              'GAME PAUSED',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 48),

            // Resume Button
            _PauseMenuButton(
              title: '▶ Resume',
              onPressed: () => game.resumeGame(),
            ),
            const SizedBox(height: 16),

            // Restart Button
            _PauseMenuButton(
              title: '🔄 Restart',
              onPressed: () => game.resetGame(),
            ),
            const SizedBox(height: 16),

            // Quit to Main Menu Button
            _PauseMenuButton(
              title: '🏠 Main Menu',
              onPressed: () {
                // Return to Main Menu completely destroying this current GameWidget tree
                Navigator.of(context).pop();
              },
              isSecondary: true,
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable button specifically for the pause menu overlay
class _PauseMenuButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isSecondary;

  const _PauseMenuButton({
    required this.title,
    required this.onPressed,
    this.isSecondary = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSecondary ? Colors.transparent : AppTheme.primaryColor,
          foregroundColor: Colors.white,
          side: isSecondary ? const BorderSide(color: AppTheme.primaryColor, width: 2) : BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _GameOverOverlay extends StatelessWidget {
  final SkyBarrageGame game;

  const _GameOverOverlay({required this.game});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppTheme.surfaceColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppTheme.errorColor, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 20,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            const Text(
              'GAME OVER',
              style: TextStyle(
                color: AppTheme.errorColor,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 24),

            // Score Display
            Text(
              'Score: ${game.score}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Best Score: ${game.highScore}',
              style: const TextStyle(
                color: AppTheme.secondaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 48),

            // Play Again Button
            _PauseMenuButton(
              title: '🔄 Play Again',
              onPressed: () {
                game.resetGame();
                game.overlays.remove('GameOver');
              },
            ),
            const SizedBox(height: 16),

            // Quit to Main Menu Button
            _PauseMenuButton(
              title: '🏠 Main Menu',
              onPressed: () {
                Navigator.of(context).pop();
              },
              isSecondary: true,
            ),
          ],
        ),
      ),
    );
  }
}
