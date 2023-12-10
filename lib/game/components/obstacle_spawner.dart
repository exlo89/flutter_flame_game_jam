import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter_flame_game_jam/game/components/ice_rock.dart';
import 'package:flutter_flame_game_jam/game/my_game.dart';

class ObstacleSpawner extends TimerComponent with HasGameRef<MyGame> {
  ObstacleSpawner()
      : super(
          period: 2,
          repeat: true,
          autoStart: true,
        );

  Random random = Random();
  @override
  void onTick() {
    add(
      IceRock(
        position: Vector2(game.size.x, game.size.y / 3 * 2),
      ),
    );
  }
}
