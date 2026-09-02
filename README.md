# Platformemar

A colorful 2D platform game with collectibles, enemies, moving platforms, multiple levels, and a main menu.

## Features

- Run, jump, and double-jump movement
- Collectibles and health pickups
- Mushroom enemies
- Moving platforms and out-of-bounds handling
- Level finish goals
- Music, sound effects, pause menu, and animated backgrounds

## Getting started

1. Install Godot 4.4 or a compatible Godot 4 release.
2. Import `project.godot` in the Godot Project Manager.
3. Open the project and press **F6** or **F5** to run it.

The game starts at `scenes/menu/main_menu.tscn`.

## Project structure

- `assets/` — character art, terrain, backgrounds, music, and sound effects
- `scenes/game_objects/` — player, enemies, collectibles, and level objects
- `scenes/menu/` — menu scenes and logic
- `scenes/` — game levels and shared scenes
- `game_manager.gd` — shared game-state logic

## Status

This project is a work in progress.
