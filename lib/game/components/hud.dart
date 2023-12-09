import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_game_jam/game/my_game.dart';

class Hud extends PositionComponent with HasGameRef<MyGame> {
  Hud({
    super.position,
    super.size,
    super.scale,
    super.angle,
    super.anchor,
    super.children,
    super.priority = 5,
  });

  late TextComponent _scoreTextComponent;

  @override
  Future<void> onLoad() async {
    debugMode = true;
    _scoreTextComponent = TextComponent(
      text: '${game.temperature}',
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 32,
          color: Color.fromRGBO(10, 10, 10, 1),
        ),
      ),
      anchor: Anchor.center,
      position: Vector2(game.size.x / 2, 0 + 60),
    );
    add(_scoreTextComponent);
  }

  @override
  void update(double dt) {
    _scoreTextComponent.text = 'Temperatur: ${game.temperature.toString()}';
  }
}
