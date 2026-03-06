import 'dart:io';

void main() {
  final Map<String, List<String>> structure = {
    'lib/core': [
      'game.dart',
      'game_state.dart',
    ],
    'lib/player': [
      'player.dart',
      'player_controller.dart',
    ],
    'lib/enemies': [
      'enemy.dart',
      'enemy_spawner.dart',
    ],
    'lib/weapons': [
      'bullet.dart',
      'weapon_system.dart',
    ],
    'lib/collisions': [
      'collision_manager.dart',
    ],
    'lib/ui': [
      'hud.dart',
      'start_screen.dart',
      'game_over_screen.dart',
    ],
    'lib/utils': [
      'constants.dart',
      'helpers.dart',
    ]
  };

  for (var entry in structure.entries) {
    final directory = Directory(entry.key);

    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
      print('Created directory: ${entry.key}');
    }

    for (var file in entry.value) {
      final filePath = '${entry.key}/$file';
      final newFile = File(filePath);

      if (!newFile.existsSync()) {
        newFile.createSync();
        newFile.writeAsStringSync(
          '// $file\n// Auto-generated game file\n',
        );
        print('Created file: $filePath');
      }
    }
  }

  print('\nGame structure created successfully!');
}