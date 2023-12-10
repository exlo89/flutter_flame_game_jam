import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_flame_game_jam/game/components/ice_rock.dart';
import 'package:flutter_flame_game_jam/game/my_game.dart';

class Player extends SpriteAnimationComponent
    with HasGameRef<MyGame>, CollisionCallbacks {
  Player()
      : super(
          scale: Vector2.all(5),
          anchor: Anchor.center,
        );

  int lives = 3;

  @override
  Future<FutureOr<void>> onLoad() async {
    animation = await gameRef.loadSpriteAnimation(
      'player.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.1,
        textureSize: Vector2(16, 24),
        texturePosition: Vector2(0, 49),
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
    position = Vector2((gameRef.size.y / 100) * 20, game.size.y / 3 * 2);
    scale = Vector2.all(gameRef.size.y / 100);
    super.update(dt);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is IceRock && other.hasCollision) {
      if (lives > 1) {
        lives -= 1;
      } else {
        gameRef.gameOver();
      }
    }
  }
}
