import 'dart:async';
import 'dart:ui';
import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/input.dart';
import 'package:flutter_flame_game_jam/game/game_main.dart';

class HotColdButton extends SpriteButtonComponent with HasGameRef<GameMain> {
  final imagesLoader = Images();

  @override
  Future<FutureOr<void>> onLoad() async {
    super.onLoad();
    anchor = Anchor.bottomCenter;
    position = Vector2(game.size.x / 2, game.size.y - 60);
    button = await game.loadSprite('button/blue_button09.png');
    buttonDown = await game.loadSprite('button/blue_button10.png');
    // TODO: implement onLoad
  }

  @override
  void onTapDown(TapDownEvent _) {
    // TODO: implement onTapDown
    super.onTapDown(_);
  }
}
