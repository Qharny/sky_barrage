import 'dart:async';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:sky_barrage/game/sky_barrage_game.dart';

class Bullet extends PositionComponent with HasGameRef<SkyBarrageGame> {
  static const double _speed = -500; // Moves upward
  
  Bullet({required Vector2 position}) : super(position: position, size: Vector2(6, 20));

  @override
  Future<void> onLoad() async {
    // We'll just draw a simple vertical rect as a bullet for now
    super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    
    // Move up
    position.y += _speed * dt;

    // Remove if it goes off screen
    if (position.y + size.y < 0) {
      removeFromParent();
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    // Draw a bright blue/orange glowing bullet
    final paint = Paint()..color = Colors.orangeAccent;
    canvas.drawRect(size.toRect(), paint);
  }
}
