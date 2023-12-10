import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_game_jam/game/components/background.dart';
import 'package:flutter_flame_game_jam/game/components/game_over.dart';
import 'package:flutter_flame_game_jam/game/components/hot_cold_button.dart';
import 'package:flutter_flame_game_jam/game/components/hud.dart';
import 'package:flutter_flame_game_jam/game/components/ice_rock.dart';
import 'package:flutter_flame_game_jam/game/components/obstacle_spawner.dart';
import 'package:flutter_flame_game_jam/game/components/player.dart';

enum TemperatureState { isIncreasing, isDecreasing }

enum GameState { playing, intro, gameOver }

class MyGame extends FlameGame with HasCollisionDetection {
  late Background background = Background();
  late Hud hud = Hud();
  late Player player = Player();
  late HotColdButton hotColdButton = HotColdButton();
  late ObstacleSpawner obstacleSpawner = ObstacleSpawner();
  late GameOver gameOverOverlay = GameOver();

  double temperature = 0;
  double maxTemperature = 10;
  double minTemperature = -10;

  GameState state = GameState.intro;
  bool get isPlaying => state == GameState.playing;
  bool get isGameOver => state == GameState.gameOver;
  bool get isIntro => state == GameState.intro;

  TemperatureState temperatureState = TemperatureState.isDecreasing;
  late Timer temperatureTimer =
      Timer(0.1, repeat: true, autoStart: false, onTick: _onTick);

  @override
  FutureOr<void> onLoad() {
    add(background);
    add(hud);
    add(player);
    add(hotColdButton);
    add(obstacleSpawner);
    temperatureTimer.start();
  }

  @override
  //bool get debugMode => true;

  @override
  void update(double dt) {
    temperatureTimer.update(dt);
    if (temperature > 10 || temperature < -10) {
      gameOver();
    }
    super.update(dt);
  }

  void _onTick() {
    // increase temperature and stop if has reached maximum
    if (temperatureState == TemperatureState.isIncreasing &&
        temperature <= maxTemperature) {
      temperature = _roundTemperature(temperature + 0.1);
    }
    // decrease temperature and stop if has reached minimum
    if (temperatureState == TemperatureState.isDecreasing &&
        temperature >= minTemperature) {
      temperature = _roundTemperature(temperature - 0.1);
    }
  }

  double _roundTemperature(double value) {
    return ((value * 10).round() / 10);
  }

  void gameOver() {
    add(gameOverOverlay);
    background.parallax!.baseVelocity = Vector2.zero();
    player.removeFromParent();
    hotColdButton.removeFromParent();
    hud.removeFromParent();
    obstacleSpawner.removeFromParent();
  }
}
