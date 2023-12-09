import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_game_jam/game/components/HotColdButton.dart';
import 'package:flutter_flame_game_jam/game/components/player.dart';
import 'package:flutter_flame_game_jam/game/levels/level.dart';

import 'components/hud.dart';

enum TemperatureState { isIncreasing, isDecreasing }

class GameMain extends FlameGame {
  double sliderValue = 0.0;
  TemperatureState tempState = TemperatureState.isIncreasing;

  Timer timer = Timer(5.0, repeat: true, autoStart: false);

  Timer heatProgressTimer = Timer(0.1, repeat: true, autoStart: false);

  @override
  Color backgroundColor() {
    // TODO: implement backgroundColor
    return Colors.transparent;
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

  @override
  Future<FutureOr<void>> onLoad() async {
    super.onLoad();
    heatProgressTimer.onTick = () => onTick();
    add(Background());
    add(Player());
    add(Hud());
    add(HotColdButton());
  }

  @override
  void update(double dt) {
    timer.update(dt);
    heatProgressTimer.update(dt);
    super.update(dt);
  }
}
