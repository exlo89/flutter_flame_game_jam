import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_game_jam/game/components/player.dart';

class GameMain extends FlameGame {
  double sliderValue = 0;

  @override
  Future<FutureOr<void>> onLoad() async {
    add(Player());
  }
}
