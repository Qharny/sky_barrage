import 'dart:async';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:sky_barrage/game/sky_barrage_game.dart';
import 'package:sky_barrage/game/components/bullet.dart';
import 'package:flutter/services.dart';

class Player extends PositionComponent with HasGameRef<SkyBarrageGame>, KeyboardHandler {
  static const double _speed = 300;
  static const double _fireRate = 0.3; // Seconds between shots

  double _timeSinceLastShot = 0;
  
  // -1 for left, 1 for right, 0 for idle
  double moveDirection = 0;

  Player() : super(size: Vector2(50, 50));

  @override
  Future<void> onLoad() async {
    // Start at bottom center
    position = Vector2(
      gameRef.size.x / 2 - size.x / 2,
      gameRef.size.y - size.y - 40,
    );
    super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (gameRef.isGameOver) return;

    // Horizontal Movement
    position.x += moveDirection * _speed * dt;

    // Clamp to screen bounds
    position.x = position.x.clamp(0, gameRef.size.x - size.x);

    // Auto-fire logic
    _timeSinceLastShot += dt;
    if (_timeSinceLastShot >= _fireRate) {
      _shoot();
      _timeSinceLastShot = 0;
    }
  }

  void _shoot() {
    // Spawn bullet at the center-top of the player
    final bullet = Bullet(
      position: Vector2(
        position.x + size.x / 2 - 3, // center x
        position.y - 20, // slightly above the ship
      ),
    );
    gameRef.add(bullet);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    // Temp: draw a white triangle to represent the ship
    final paint = Paint()..color = Colors.white;
    final path = Path()
      ..moveTo(size.x / 2, 0) // Top Tip
      ..lineTo(size.x, size.y) // Bottom Right
      ..lineTo(0, size.y) // Bottom Left
      ..close();

    canvas.drawPath(path, paint);
  }
  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    moveDirection = 0;

    // Support both Arrows and WASD
    final isLeftPressed = keysPressed.contains(LogicalKeyboardKey.arrowLeft) || keysPressed.contains(LogicalKeyboardKey.keyA);
    final isRightPressed = keysPressed.contains(LogicalKeyboardKey.arrowRight) || keysPressed.contains(LogicalKeyboardKey.keyD);

    if (isLeftPressed && !isRightPressed) {
      moveDirection = -1;
    } else if (isRightPressed && !isLeftPressed) {
      moveDirection = 1;
    }

    return super.onKeyEvent(event, keysPressed);
  }
}
