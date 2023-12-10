import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter_flame_game_jam/game/components/fire_rock.dart';
import 'package:flutter_flame_game_jam/game/components/ice_rock.dart';
import 'package:flutter_flame_game_jam/game/my_game.dart';

class ObstacleSpawner extends TimerComponent with HasGameRef<MyGame> {
  ObstacleSpawner()
      : super(
          period: 4,
          repeat: true,
          autoStart: true,
        );

  Random random = Random();
  @override
  void onTick() {
    if (random.nextBool()) {
      add(
        IceRock(
          position: Vector2(game.size.x, game.size.y / 3 * 2),
        ),
      );
    } else {
      add(
        FireRock(
          position: Vector2(game.size.x, game.size.y / 3 * 2),
        ),
      );
    }
  }
}
