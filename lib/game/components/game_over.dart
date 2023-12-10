import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_game_jam/game/my_game.dart';

class GameOver extends TextComponent with HasGameRef<MyGame> {
  GameOver()
      : super(
          anchor: Anchor.center,
        );
  @override
  FutureOr<void> onLoad() {
    text = 'Game Over';
    textRenderer = TextPaint(
      style: const TextStyle(
        color: Colors.black,
        fontSize: 40,
      ),
    );
  }

  @override
  void update(double dt) {
    scale = Vector2.all((gameRef.size.y / 100) * 0.4);
    position = Vector2(gameRef.size.x / 2, gameRef.size.y / 2);
    super.update(dt);
  }
}
