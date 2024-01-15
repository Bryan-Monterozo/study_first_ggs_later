import 'package:flame/components.dart';
import 'package:flame/game.dart';

class EnemySprite extends FlameGame {
  // SpriteComponent enemy = SpriteComponent();

  @override
  Future<void> onLoad() async {
    final image = await images.load('/ghost1t.png');
    // final jsonData = await assets.readJson('images/ghost_hash.json');
    final animation = SpriteAnimation.fromFrameData(image, SpriteAnimationData.sequenced(
      amount: 5,
      textureSize: Vector2(1000, 1800),
      stepTime: 0.5,
    ));
    final spriteSize = Vector2(180, 340); // 1000 / 5, 1800 / 5 then -20 for all
    final animationComponent = SpriteAnimationComponent(
      animation: animation,
      position: Vector2(10, -70), //(size - spriteSize) / 2
      size: spriteSize,
    );
    add(animationComponent);
  }
}
