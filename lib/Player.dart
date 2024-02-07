import 'dart:async';

import 'package:flame/components.dart';
import 'package:seoul/Bullet.dart';
import 'package:seoul/main.dart';

class Player extends SpriteAnimationComponent with HasGameReference<SeoulGame> {
  late final SpawnComponent _bulletSpawner;
  Player() : super(size: Vector2(100, 150), anchor: Anchor.center);

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    animation = await game.loadSpriteAnimation(
        'player.png',
        SpriteAnimationData.sequenced(
            amount: 4, stepTime: .2, textureSize: Vector2(32, 48)));
    position = game.size / 2;

    _bulletSpawner = SpawnComponent(
        factory: (index) {
          return Bullet(position: position);
        },
        period: .2,
        selfPositioning: true,
        autoStart: false);
    add(_bulletSpawner);
  }

  void move(Vector2 delta) {
    position.add(delta);
  }

  void startShooting() {
    _bulletSpawner.timer.start();
  }

  void stopShooting() {
    _bulletSpawner.timer.stop();
  }
}
