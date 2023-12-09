import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            IceRockSpawner(),
            HotColdButton(),
            Hud(),
          ],
        );

  double sliderValue = 0;

  TemperatureState tempState = TemperatureState.isIncreasing;
  Timer heatProgressTimer = Timer(0.1, repeat: true, autoStart: false);

  @override
  bool get debugMode => true;

  @override
  Future<FutureOr<void>> onLoad() async {
    add(Player());
    heatProgressTimer.onTick = onTick;
  }

  @override
  void update(double dt) {
    heatProgressTimer.update(dt);
    super.update(dt);
  }

  void onTick() {
    if (tempState == TemperatureState.isIncreasing) {
      final tmpSliderValue = sliderValue + 0.1;

      sliderValue = ((tmpSliderValue * 10).round() / 10);
    } else if (tempState == TemperatureState.isDecreasing) {
      final tmpSliderValue = sliderValue - 0.1;
      sliderValue = ((tmpSliderValue * 10).round() / 10);
    }
  }
}
