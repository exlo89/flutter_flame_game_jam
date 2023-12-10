import 'dart:async';
import 'package:flame/components.dart' as comp;
import 'package:flame/events.dart';
import 'package:flame/input.dart';
import 'package:flutter_flame_game_jam/game/my_game.dart';

class HotColdButton extends SpriteButtonComponent with comp.HasGameRef<MyGame> {
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
    coldButtonIsPressed =
        await game.loadSprite('button/blue_button_pressed.png');
    coldButton = await game.loadSprite('button/blue_button_default.png');

    anchor = comp.Anchor.bottomCenter;
    position = Vector2(game.size.x / 2, game.size.y - 60);
    button = await game.loadSprite('button/blue_button_default.png');
    buttonDown = await game.loadSprite('button/blue_button_pressed.png');
  }

  @override
  void update(double dt) {
    scale = Vector2.all((gameRef.size.y / 100) * 0.2);
    position = Vector2(gameRef.size.x / 2, (gameRef.size.y / 100) * 95);
    super.update(dt);
  }

  @override
  Future<void> onTapDown(TapDownEvent _) async {
    super.onTapDown(_);

    // button =
    // buttonDown =
    sprites = {
      ButtonState.down: game.temperatureState == TemperatureState.isIncreasing
          ? coldButtonIsPressed
          : hotButtonIsPressed,
      ButtonState.up: game.temperatureState != TemperatureState.isIncreasing
          ? coldButton
          : hotButton,
    };
    game.temperatureState =
        game.temperatureState == TemperatureState.isIncreasing
            ? TemperatureState.isDecreasing
            : TemperatureState.isIncreasing;
    game.temperatureTimer.start();
  }
}
