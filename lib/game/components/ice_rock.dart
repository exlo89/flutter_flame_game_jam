import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_flame_game_jam/game/components/player.dart';
import 'package:flutter_flame_game_jam/game/my_game.dart';

class IceRock extends SpriteComponent with HasGameRef<MyGame>, CollisionCallbacks {
  IceRock({super.position})
      : super(
          scale: Vector2.all(0.2),
          anchor: Anchor.center,
        );

  static const _speed = 120;

  @override
  Future<FutureOr<void>> onLoad() async {
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

    if (gameRef.sliderValue > 2) {
      sprite = 
    }

    position.x -= _speed * dt;

    if (position.x < 0) {
      removeFromParent();
    }
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Player) {
      other.removeFromParent();
    }
  }
}

class IceRockSpawner extends TimerComponent with HasGameRef<MyGame> {
  IceRockSpawner()
      : super(
          period: 2,
          repeat: true,
          autoStart: true,
        );

  @override
  void onTick() {
    gameRef.add(
      IceRock(
        position: Vector2(game.size.x, game.size.y / 3 * 2),
      ),
    );
  }
}
