import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:seoul/Player.dart';

class SeoulGame extends FlameGame with PanDetector {
  late Player player;

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    player = Player()
      ..position = size / 2
      ..width = 50
      ..height = 100
      ..anchor = Anchor.center;
    add(player);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.move(info.delta.global);
  }
}

void main() {
  // runApp(const MyApp());
  runApp(GameWidget<SeoulGame>(game: SeoulGame()));
}
