import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_game_jam/game/my_game.dart';

class Hud extends PositionComponent with HasGameRef<MyGame> {
  Hud({
    super.position,
    super.size,
    super.scale,
    super.angle,
    super.children,
    super.priority = 5,
  }) : super(
          anchor: Anchor.topCenter,
        );

  late TextComponent _scoreTextComponent;

  @override
  Future<void> onLoad() async {
    position = Vector2(gameRef.size.x / 2, gameRef.size.y / 2);
    _scoreTextComponent = TextComponent(
      text: '${game.temperature}',
      anchor: Anchor.center,
      scale: Vector2.all(0.4),
    );
    add(_scoreTextComponent);
  }

  @override
  void update(double dt) {
    scale = Vector2.all((gameRef.size.y / 100) * 0.4);
    position = Vector2(gameRef.size.x / 2, (gameRef.size.y / 100) * 10);
    _scoreTextComponent.text = 'Temperatur: ${game.temperature.toString()}';
  }
}
