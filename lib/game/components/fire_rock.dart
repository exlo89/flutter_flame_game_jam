import 'dart:async' as asy;

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_flame_game_jam/game/components/player.dart';
import 'package:flutter_flame_game_jam/game/my_game.dart';

class FireRock extends SpriteComponent
    with HasGameRef<MyGame>, CollisionCallbacks {
  FireRock({super.position})
      : super(
          scale: Vector2.all(0.2),
          anchor: Anchor.center,
        );

  static const _speed = 120;

  bool hasCollision = true;
  late Sprite fogSprite;
  late Sprite fireSprite;
  late Timer removeTimer = Timer(2, onTick: () => removeFromParent());

  @override
  Future<asy.FutureOr<void>> onLoad() async {
    fireSprite = await Sprite.load('fire_rock.png');
    fogSprite = await Sprite.load('fog_cloud.png');
    sprite = fireSprite;
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

    if (gameRef.temperature < -1) {
      sprite = fogSprite;
      hasCollision = false;
      asy.Timer.periodic(const Duration(seconds: 2), (timer) {
        removeFromParent();
      });
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
