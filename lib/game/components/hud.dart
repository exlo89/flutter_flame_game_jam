import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_game_jam/game/my_game.dart';

class Hud extends PositionComponent with HasGameRef<MyGame> {
  final TextComponent _scoreText = TextComponent(
    anchor: Anchor.center,
  );

  final TextComponent _liveText = TextComponent(
    anchor: Anchor.center,
  );

  @override
  Future<void> onLoad() async {
    add(_scoreText);
    add(_liveText);
  }

  @override
  void update(double dt) {
    _scoreText.position =
        Vector2(gameRef.size.x / 2, (gameRef.size.y / 100) * 10);
    _scoreText.scale = Vector2.all((gameRef.size.y / 100) * 0.3);
    _liveText.position =
        Vector2((gameRef.size.y / 100) * 20, (gameRef.size.y / 100) * 10);
    _liveText.scale = Vector2.all((gameRef.size.y / 100) * 0.2);
    _scoreText.text = 'Temperatur: ${gameRef.temperature}';
    _liveText.text = 'Health: ${gameRef.player.lives}';
  }
}
