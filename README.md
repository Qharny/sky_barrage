# Sky Barrage
Arcade Shooting Game Built with Flutter

## 1. Introduction
### 1.1 Background
Mobile gaming has become one of the most popular forms of digital entertainment due to the widespread use of smartphones. Arcade-style shooting games remain popular because they are easy to understand, fast-paced, and highly engaging. Developing such games using modern frameworks helps developers understand concepts such as animation, collision detection, event handling, and real-time updates.

Flutter, a modern UI toolkit developed by Google, allows developers to create cross-platform applications efficiently. When combined with the game engine Flame Engine, Flutter becomes capable of building interactive 2D games.

The Sky Barrage game is a simple arcade shooting game where players control a fighter aircraft that must defend the sky by destroying enemy drones.

## 2. Problem Statement
Many beginner developers struggle to understand how game logic works because most tutorials focus only on UI development. There is a need for simple game projects that demonstrate:
- Game loops
- Object movement
- Collision detection
- Score systems
- Game state management

Sky Barrage addresses this by providing a simple but complete shooting game architecture built using Flutter.

## 3. Objectives
### 3.1 Main Objective
To develop a simple 2D arcade shooting game using Flutter that demonstrates core game development concepts.

### 3.2 Specific Objectives
- Implement a player-controlled aircraft.
- Implement enemy spawning mechanics.
- Implement a shooting system.
- Implement collision detection between bullets and enemies.
- Implement a scoring system.
- Implement game states such as start, playing, and game over.

## 4. Scope of the Application
The game focuses on a single-player arcade experience.

### Included Features
- Player-controlled aircraft
- Enemy spawning
- Shooting mechanics
- Score tracking
- Game over detection
- Simple UI display

### Excluded Features
- Multiplayer gameplay
- Advanced AI enemies
- Online leaderboards
- In-game purchases

These can be implemented in future versions.

## 5. System Overview
Sky Barrage is a 2D action shooting game where the player must survive as long as possible by destroying enemies before they reach the bottom of the screen or collide with the player.

### Gameplay Overview
- The game starts on a start screen.
- The player begins the game.
- Enemy drones begin spawning from the top of the screen.
- The player moves left and right.
- The player shoots bullets to destroy enemies.
- Destroyed enemies increase the player's score.
- The game ends if the player collides with an enemy.

## 6. System Architecture
The system architecture divides the game into several modules to maintain organization and scalability.

### 6.1 Game Engine Layer
Handles the core functionality of the game.

**Responsibilities:**
- Game loop
- Rendering objects
- Updating positions
- Handling frame updates

### 6.2 Player Module
Handles all player-related functionality.

**Responsibilities:**
- Player movement
- Player shooting
- Player collision detection

**Player Attributes:**
- Position
- Health
- Shooting ability

### 6.3 Enemy Module
Responsible for enemy behavior.

**Responsibilities:**
- Enemy spawning
- Enemy movement
- Enemy removal

**Enemy Types:**
- Basic drone
- Fast drone (future upgrade)

### 6.4 Weapon System
Handles the firing mechanics of the player.

**Responsibilities:**
- Creating bullets
- Bullet movement
- Removing bullets when off-screen

### 6.5 Collision Detection System
Handles interactions between objects.

**Collision Types:**
- Bullet vs Enemy
- Enemy vs Player

**Actions:**
- Destroy enemy
- Increase score
- End game

### 6.6 Game State Manager
Controls the different stages of the game.

**Game States:**
- Start Screen
- Playing State
- Game Over State

### 6.7 Score System
Tracks player progress.

**Responsibilities:**
- Increase score when enemies are destroyed
- Display score on screen

## 7. Game Flow
The gameplay follows a simple loop.

Start Screen
↓
Player Presses Start
↓
Game Begins
↓
Enemies Spawn
↓
Player Shoots Enemies
↓
Score Increases
↓
Difficulty Gradually Increases
↓
Player Collides With Enemy
↓
Game Over Screen

## 8. Functional Requirements
The system must:
- Allow the player to start the game.
- Allow the player to move horizontally.
- Allow the player to shoot bullets.
- Spawn enemies at intervals.
- Detect collisions between bullets and enemies.
- Increase score when enemies are destroyed.
- End the game when the player is hit.

## 9. Non-Functional Requirements
### Performance
The game must run smoothly at approximately 60 frames per second.

### Usability
The controls must be simple and intuitive.

### Compatibility
The game should run on both Android and iOS devices.

### Scalability
The architecture should allow future upgrades such as:
- power-ups
- boss battles
- additional enemy types

## 10. User Interface Design
The game contains the following screens:

**Start Screen**
Displays:
- Game title
- Start button

**Gameplay Screen**
Displays:
- Player aircraft
- Enemies
- Bullets
- Score counter

**Game Over Screen**
Displays:
- Final score
- Restart option

## 11. Future Improvements
Possible improvements include:
- Power-up system
- Multiple enemy types
- Boss enemies
- Sound effects and background music
- Leaderboard system
- Difficulty levels

## 12. Conclusion
Sky Barrage demonstrates how a simple arcade shooting game can be developed using Flutter and the Flame Engine. The modular architecture ensures that the system remains maintainable and scalable for future improvements.

The project provides a practical example for developers learning game development concepts such as game loops, collision detection, and real-time object interactions.
