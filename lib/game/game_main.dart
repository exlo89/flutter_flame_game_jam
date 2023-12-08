import 'dart:async';

import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';

class GameMain extends FlameGame with HasKeyboardHandlerComponents {
  @override
  Future<FutureOr<void>> onLoad() async {
    await super.onLoad();
  }
}
