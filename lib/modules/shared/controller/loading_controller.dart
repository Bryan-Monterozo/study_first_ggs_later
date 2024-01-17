import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool needInitLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    if (needInitLoading.value) {
      Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      // update(['loading']);
    });
    }
  }

  void initLoading() {
    isLoading.value = true;
    needInitLoading.value = false;
    // update(['loading']);
  }

  void showLoading() {
    isLoading.value = true;
    update(['loading']);
  }

  void hideLoading() {
    isLoading.value = false;
    update(['loading']);
  }
}

class LoadingSprite extends FlameGame {

  @override
  Color backgroundColor() => Colors.grey.withOpacity(0.7);

  @override
  Future<void> onLoad() async {
    final image = await images.fromCache('hourglass.png');
    double width = canvasSize.x;
    double height = canvasSize.y;
    print(width);
    print(height);

    final animation = SpriteAnimation.fromFrameData(
      image,
      SpriteAnimationData.sequenced(
        amount: 27,
        textureSize: Vector2(1280, 1280),
        stepTime: 0.1,
      ),
    );
    final spriteSize = Vector2(150, 150);
    final animationComponent = SpriteAnimationComponent(
      animation: animation,
      position: (canvasSize - spriteSize) / 2,
      size: spriteSize,
    );
    add(animationComponent);
  }
}


class LoadingSpriteTrans extends FlameGame {

  @override
  Color backgroundColor() => Colors.transparent;

  @override
  Future<void> onLoad() async {
    final image = await images.fromCache('hourglass.png');
    double width = canvasSize.x;
    double height = canvasSize.x;
    print(width);
    print(height);

    final animation = SpriteAnimation.fromFrameData(
      image,
      SpriteAnimationData.sequenced(
        amount: 27,
        textureSize: Vector2(1280, 1280),
        stepTime: 0.1,
      ),
    );
    final spriteSize = Vector2(150, 150);
    final animationComponent = SpriteAnimationComponent(
      animation: animation,
      position: (canvasSize - spriteSize) / 2,
      size: spriteSize,
    );
    add(animationComponent);
  }
}