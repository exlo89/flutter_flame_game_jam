import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_flame_game_jam/game/my_game.dart';

class Player extends SpriteAnimationComponent with HasGameRef<MyGame> {
  Player()
      : super(
          scale: Vector2.all(5),
          anchor: Anchor.center,
        );

  @override
  Future<FutureOr<void>> onLoad() async {
    animation = await gameRef.loadSpriteAnimation(
      'player.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.1,
        textureSize: Vector2(16, 24),
        texturePosition: Vector2(0, 48),
      ),
    );
    add(
      RectangleHitbox.relative(
        Vector2(0.8, 0.8),
        parentSize: size,
      ),
    );
  }

  @override
  void update(double dt) {
    position = Vector2(100, game.size.y / 3 * 2);
    super.update(dt);
  }
}
