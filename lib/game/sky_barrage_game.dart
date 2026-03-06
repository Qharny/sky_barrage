import 'dart:async';

import 'dart:math';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sky_barrage/game/components/player.dart';
import 'package:sky_barrage/game/components/enemy.dart';

class SkyBarrageGame extends FlameGame with HasKeyboardHandlerComponents {
  int score = 0;
  int highScore = 0;
  bool isGameOver = false;

  late Player player;

  // Enemy Spawners
  double _timeSinceLastEnemy = 0;
  double _enemySpawnRate = 1.0; // Spawns an enemy every 1.0 seconds

  @override
  Color backgroundColor() => const Color(0xFF0F172A); // Matches AppTheme

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    await _loadHighScore();

    // Init and Add Player
    player = Player();
    add(player);
  }

  Future<void> _loadHighScore() async {
    final prefs = await SharedPreferences.getInstance();
    highScore = prefs.getInt('highScore') ?? 0;
  }

  Future<void> _updateHighScore() async {
    if (score > highScore) {
      highScore = score;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('highScore', highScore);
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (isGameOver) return;

    // Spawning Logic
    _timeSinceLastEnemy += dt;
    if (_timeSinceLastEnemy >= _enemySpawnRate) {
      add(Enemy());
      _timeSinceLastEnemy = 0;

      // Slowly increase difficulty by spawning enemies faster over time
      _enemySpawnRate = max(0.3, _enemySpawnRate - 0.01);
    }
  }

  void increaseScore() {
    score += 10;
  }

  // --- Game Controls ---
  
  void pauseGame() {
    pauseEngine();
    // Use the overlay system built into Flame
    overlays.add('PauseMenu');
  }

  void resumeGame() {
    overlays.remove('PauseMenu');
    resumeEngine();
  }

  void gameOver() {
    isGameOver = true;
    _updateHighScore();
    pauseEngine();
    overlays.add('GameOver');
  }

  void resetGame() {
    score = 0;
    isGameOver = false;
    _enemySpawnRate = 1.0;
    
    // Clear all entities (enemies, bullets, players)
    removeAll(children);

    // Re-add player
    player = Player();
    add(player);

    resumeGame();
  }
}
