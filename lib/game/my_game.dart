import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_game_jam/game/components/background.dart';
import 'package:flutter_flame_game_jam/game/components/hot_cold_button.dart';
import 'package:flutter_flame_game_jam/game/components/hud.dart';
import 'package:flutter_flame_game_jam/game/components/ice_rock.dart';
import 'package:flutter_flame_game_jam/game/components/player.dart';

enum TemperatureState { isIncreasing, isDecreasing }

class MyGame extends FlameGame with HasCollisionDetection {
  MyGame()
      : super(
          children: [
            Background(),
            //IceRockSpawner(),
            HotColdButton(),
            Hud(),
            Player(),
          ],
        );

  double temperature = 0;
  double maxTemperature = 10;
  double minTemperature = -10;

  TemperatureState temperatureState = TemperatureState.isIncreasing;
  late Timer temperatureTimer = Timer(0.1, repeat: true, autoStart: false, onTick: onTick);

  @override
  bool get debugMode => true;

  @override
  Color backgroundColor() {
    return Colors.transparent;
  }

  @override
  void update(double dt) {
    temperatureTimer.update(dt);
    if (temperature > 10 || temperature < -10) {
      print('death');
    }
    super.update(dt);
  }

  void onTick() {
    // increase temperature and stop if has reached maximum
    if (temperatureState == TemperatureState.isIncreasing && temperature <= maxTemperature) {
      temperature = _roundTemperature(temperature + 0.1);
    }
    // decrease temperature and stop if has reached minimum
    if (temperatureState == TemperatureState.isDecreasing && temperature >= minTemperature) {
      temperature = _roundTemperature(temperature - 0.1);
    }
  }

  double _roundTemperature(double value) {
    return ((value * 10).round() / 10);
  }
}
