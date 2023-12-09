import 'dart:async';
import 'package:flame/cache.dart';
import 'package:flame/components.dart' as comp;
import 'package:flame/events.dart';
import 'package:flame/input.dart';
import 'package:flutter_flame_game_jam/game/game_main.dart';

class HotColdButton extends SpriteButtonComponent with comp.HasGameRef<GameMain> {
  final imagesLoader = Images();
  late comp.Sprite hotButtonIsPressed;
  late comp.Sprite hotButton;
  late comp.Sprite coldButtonIsPressed;
  late comp.Sprite coldButton;
  ButtonState a = ButtonState.up;
  @override
  Future<FutureOr<void>> onLoad() async {
    super.onLoad();
    hotButtonIsPressed = await game.loadSprite('button/red_button_pressed.png');
    hotButton = await game.loadSprite('button/red_button_default.png');
    coldButtonIsPressed = await game.loadSprite('button/blue_button_pressed.png');
    coldButton = await game.loadSprite('button/blue_button_default.png');

    anchor = comp.Anchor.bottomCenter;
    position = Vector2(game.size.x / 2, game.size.y - 60);
    button = await game.loadSprite('button/blue_button_default.png');
    buttonDown = await game.loadSprite('button/blue_button_pressed.png');
    // TODO: implement onLoad
  }

  @override
  Future<void> onTapDown(TapDownEvent _) async {
    // TODO: implement onTapDown
    super.onTapDown(_);
    print(game.tempState);

    // button =
    // buttonDown =
    sprites = {
      ButtonState.down: game.tempState == TemperatureState.isIncreasing ? coldButtonIsPressed : hotButtonIsPressed,
      ButtonState.up: game.tempState != TemperatureState.isIncreasing ? coldButton : hotButton,
    };
    game.tempState =
        game.tempState == TemperatureState.isIncreasing ? TemperatureState.isDecreasing : TemperatureState.isIncreasing;
    game.heatProgressTimer.start();
  }
}
