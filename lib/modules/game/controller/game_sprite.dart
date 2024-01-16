import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class EnemySprite extends FlameGame {
  // SpriteComponent enemy = SpriteComponent();

  @override
  Future<void> onLoad() async {
    final image = await images.load('ghost1t.png');
    FlutterView view = PlatformDispatcher.instance.views.first;
    double width = view.physicalSize.width;
    double height = view.physicalSize.height;
    print(width);
    print(height);
    final animation = SpriteAnimation.fromFrameData(
        image,
        SpriteAnimationData.sequenced(
          amount: 5,
          textureSize: Vector2(1000, 1800),
          stepTime: 0.5,
        ));
    final spriteSize = Vector2(width/4, (height/4) - 20);// 1000 / 5, 1800 / 5 then -20 for all
    final animationComponent = SpriteAnimationComponent(
      animation: animation,
      position: (canvasSize - spriteSize) /
          2, //Vector2(10, -70), //(size - spriteSize) / 2
      size: spriteSize,
    );
    add(animationComponent);
  }
}
