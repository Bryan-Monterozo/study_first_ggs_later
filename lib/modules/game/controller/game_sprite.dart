import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class GhostSprite extends FlameGame {
  // SpriteComponent enemy = SpriteComponent();

  @override
  Color backgroundColor() => Colors.transparent;

  @override
  Future<void> onLoad() async {
    final image = await images.load('ghost.png');
    // FlutterView view = PlatformDispatcher.instance.views.first;
    // double width = view.physicalSize.width;
    // double height = view.physicalSize.height;
    double width = canvasSize.x;
    double height = canvasSize.y;
    print(width);
    print(height);
    final animation = SpriteAnimation.fromFrameData(
        image,
        SpriteAnimationData.sequenced(
          amount: 5,
          textureSize: Vector2(720, 1050),
          stepTime: 0.3,
        ));
    final spriteSize = Vector2((width),
        (height)); // 1000 / 5, 1800 / 5 then -20 for all
    final animationComponent = SpriteAnimationComponent(
      animation: animation,
      position: Vector2(0, 0),
      // (spriteSize - canvasSize) / 5, //Vector2(10, -70), //(size - spriteSize) / 2
      size: spriteSize,
    );
    add(animationComponent);
  }
}

class UserSprite extends FlameGame {
  @override
  Color backgroundColor() => Colors.transparent;

  @override
  Future<void> onLoad() async {
    final image = await images.load('user.png');
    // FlutterView view = PlatformDispatcher.instance.views.first;
    // double width = view.physicalSize.width;
    // double height = view.physicalSize.height;
    double width = canvasSize.x;
    double height = canvasSize.y;
    print(width);
    print(height);
    final animation = SpriteAnimation.fromFrameData(
        image,
        SpriteAnimationData.sequenced(
          amount: 10,
          textureSize: Vector2(720, 1050),
          stepTime: 0.3,
        ));
    final spriteSize = Vector2((width),
        (height)); // 1000 / 5, 1800 / 5 then -20 for all
    final animationComponent = SpriteAnimationComponent(
      animation: animation,
      position: Vector2(0, 0),
      // (spriteSize - canvasSize) / 5, //Vector2(10, -70), //(size - spriteSize) / 2
      size: spriteSize,
    );
    add(animationComponent);
  }
}

class DwarfSprite extends FlameGame {
  @override
  Color backgroundColor() => Colors.transparent;

  @override
  Future<void> onLoad() async {
    final image = await images.load('dwarf.png');
    // FlutterView view = PlatformDispatcher.instance.views.first;
    // double width = view.physicalSize.width;
    // double height = view.physicalSize.height;
    double width = canvasSize.x;
    double height = canvasSize.y;
    print(width);
    print(height);
    final animation = SpriteAnimation.fromFrameData(
        image,
        SpriteAnimationData.sequenced(
          amount: 2,
          textureSize: Vector2(720, 1050),
          stepTime: 0.3,
        ));
    final spriteSize = Vector2((width),
        (height)); // 1000 / 5, 1800 / 5 then -20 for all
    final animationComponent = SpriteAnimationComponent(
      animation: animation,
      position: Vector2(0, 0),
      // (spriteSize - canvasSize) / 5, //Vector2(10, -70), //(size - spriteSize) / 2
      size: spriteSize,
    );
    add(animationComponent);
  }
}

class SkeletonSprite extends FlameGame {
  @override
  Color backgroundColor() => Colors.transparent;

  @override
  Future<void> onLoad() async {
    final image = await images.load('skelly.png');
    // FlutterView view = PlatformDispatcher.instance.views.first;
    // double width = view.physicalSize.width;
    // double height = view.physicalSize.height;
    double width = canvasSize.x;
    double height = canvasSize.y;
    print(width);
    print(height);
    final animation = SpriteAnimation.fromFrameData(
        image,
        SpriteAnimationData.sequenced(
          amount: 3,
          textureSize: Vector2(720, 1050),
          stepTime: 0.3,
        ));
    final spriteSize = Vector2((width),
        (height)); // 1000 / 5, 1800 / 5 then -20 for all
    final animationComponent = SpriteAnimationComponent(
      animation: animation,
      position: Vector2(0, 0),
      // (spriteSize - canvasSize) / 5, //Vector2(10, -70), //(size - spriteSize) / 2
      size: spriteSize,
    );
    add(animationComponent);
  }
}

class NinjaSprite extends FlameGame {
  @override
  Color backgroundColor() => Colors.transparent;

  @override
  Future<void> onLoad() async {
    final image = await images.load('ninja.png');
    // FlutterView view = PlatformDispatcher.instance.views.first;
    // double width = view.physicalSize.width;
    // double height = view.physicalSize.height;
    double width = canvasSize.x;
    double height = canvasSize.y;
    print(width);
    print(height);
    final animation = SpriteAnimation.fromFrameData(
        image,
        SpriteAnimationData.sequenced(
          amount: 5,
          textureSize: Vector2(720, 1050),
          stepTime: 0.3,
        ));
    final spriteSize = Vector2((width),
        (height)); // 1000 / 5, 1800 / 5 then -20 for all
    final animationComponent = SpriteAnimationComponent(
      animation: animation,
      position: Vector2(0, 0),
      // (spriteSize - canvasSize) / 5, //Vector2(10, -70), //(size - spriteSize) / 2
      size: spriteSize,
    );
    add(animationComponent);
  }
}

class SlashSprite extends FlameGame {
  @override
  Color backgroundColor() => Colors.red.withOpacity(0.2);

  @override
  Future<void> onLoad() async {
    final image = await images.load('spritesheet.png');
    // FlutterView view = PlatformDispatcher.instance.views.first;
    // double width = view.physicalSize.width;
    // double height = view.physicalSize.height;
    double width = canvasSize.x;
    double height = canvasSize.y;
    print(width);
    print(height);
    final animation = SpriteAnimation.fromFrameData(
        image,
        SpriteAnimationData.sequenced(
          amount: 6,
          textureSize: Vector2(552, 402),
          stepTime: 0.2,
        ));
    final spriteSize = Vector2((width),
        (height * 1.6)); // 1000 / 5, 1800 / 5 then -20 for all
    final animationComponent = SpriteAnimationComponent(
      animation: animation,
      position: Vector2(0, 0),
      // (spriteSize - canvasSize) / 5, //Vector2(10, -70), //(size - spriteSize) / 2
      size: spriteSize,
    );
    add(animationComponent);
  }
}
