import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flame_game_jam/game/components/background.dart';
import 'package:flutter_flame_game_jam/game/components/ice_rock.dart';
import 'package:flutter_flame_game_jam/game/components/player.dart';

class MyGame extends FlameGame with HasCollisionDetection, KeyboardEvents {
  MyGame()
      : super(
          children: [
            Background(),
          ],
        );

  double sliderValue = 0;

  @override
  bool get debugMode => true;

  late TextComponent temperature;

  @override
  Future<FutureOr<void>> onLoad() async {
    add(Player());
    add(IceRockSpawner());
    temperature = TextComponent(text: 'temperatur: $sliderValue', position: Vector2(20, 20));
    add(temperature);
    add(
      KeyboardListenerComponent(
        keyDown: {
          LogicalKeyboardKey.keyW: (_) {
            sliderValue += 1;
            return false;
          },
          LogicalKeyboardKey.keyS: (_) {
            sliderValue -= 1;
            return false;
          },
        },
      ),
    );
  }

  @override
  void update(double dt) {
    temperature.text = 'temperature $sliderValue';
    super.update(dt);
  }

  @override
  KeyEventResult onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final isKeyDown = event is RawKeyDownEvent;
    if (isKeyDown && keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
      sliderValue += 1;
    }
    if (isKeyDown && keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
      sliderValue -= 1;
    }
    return KeyEventResult.ignored;
  }
}
