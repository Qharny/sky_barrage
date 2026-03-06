import 'dart:async';
import 'dart:math';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:sky_barrage/game/sky_barrage_game.dart';
import 'package:sky_barrage/game/components/bullet.dart';
import 'package:sky_barrage/game/components/player.dart';

class Enemy extends PositionComponent with HasGameRef<SkyBarrageGame> {
  static const double _speed = 150; // Moves downward
  
  Enemy() : super(size: Vector2(40, 40));

  @override
  Future<void> onLoad() async {
    // Spawn at a random X position at the top of the screen
    final randomX = Random().nextDouble() * (gameRef.size.x - size.x);
    position = Vector2(randomX, -size.y);
    super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    
    // Move down
    position.y += _speed * dt;

    // Remove if it goes off screen holding bottom
    if (position.y > gameRef.size.y) {
      removeFromParent();
    }

    _checkCollisions();
  }

  void _checkCollisions() {
    if (isRemoving) return;

    // 1) Check Bullet Collisions
    final bullets = gameRef.children.whereType<Bullet>();
    for (final bullet in bullets) {
      if (bullet.isRemoving) continue;
      
      // Simple AABB collision
      if (toRect().overlaps(bullet.toRect())) {
        // Destroy both
        removeFromParent();
        bullet.removeFromParent();
        
        // Increase Score
        gameRef.increaseScore();
        return;
      }
    }

    // 2) Check Player Collision
    final players = gameRef.children.whereType<Player>();
    if (players.isNotEmpty) {
      final player = players.first;
      if (toRect().overlaps(player.toRect())) {
        gameRef.gameOver();
      }
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    // Draw a red square for the enemy
    final paint = Paint()..color = Colors.redAccent;
    canvas.drawRect(size.toRect(), paint);
  }
}
