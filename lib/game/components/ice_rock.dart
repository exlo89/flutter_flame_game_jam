import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_flame_game_jam/game/components/player.dart';
import 'package:flutter_flame_game_jam/game/my_game.dart';

class IceRock extends SpriteComponent
    with HasGameRef<MyGame>, CollisionCallbacks {
  IceRock({super.position})
      : super(
          scale: Vector2.all(0.2),
          anchor: Anchor.center,
        );

  static const _speed = 120;

  bool hasCollision = true;
  late Sprite fogSprite;
  late Sprite iceSprite;

  @override
  Future<FutureOr<void>> onLoad() async {
    iceSprite = await Sprite.load('ice_rock.png');
    fogSprite = await Sprite.load('fog_cloud.png');
    sprite = await Sprite.load('ice_rock.png');
    add(
      RectangleHitbox.relative(
        Vector2(0.8, 0.8),
        parentSize: size,
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (gameRef.temperature > 2) {
      sprite = fogSprite;
      hasCollision = false;
    } else {
      sprite = iceSprite;
      hasCollision = true;
    }

    position.y = game.size.y / 3 * 2;
    position.x -= _speed * dt;
    scale = Vector2.all((gameRef.size.y / 100) * 0.03);

    if (position.x < 0) {
      removeFromParent();
    }
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Player && hasCollision) {
      removeFromParent();
    }
  }
}
