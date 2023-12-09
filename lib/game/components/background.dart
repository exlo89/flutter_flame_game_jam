import 'dart:async';

import 'package:flame/parallax.dart';
import 'package:flame/components.dart';
import 'package:flutter_flame_game_jam/game/my_game.dart';

class Background extends ParallaxComponent<MyGame> with HasGameRef<MyGame> {
  @override
  Future<FutureOr<void>> onLoad() async {
    parallax = await game.loadParallax(
      [
        ParallaxImageData('background/sky.png'),
        ParallaxImageData('background/clouds_bg.png'),
        ParallaxImageData('background/glacial_mountains.png'),
        ParallaxImageData('background/cloud_lonely.png'),
        ParallaxImageData('background/clouds_mg_3.png'),
        ParallaxImageData('background/clouds_mg_2.png'),
        ParallaxImageData('background/clouds_mg_1.png'),
      ],
      baseVelocity: Vector2(10, 0),
      velocityMultiplierDelta: Vector2(1.5, 0),
    );
  }
}
