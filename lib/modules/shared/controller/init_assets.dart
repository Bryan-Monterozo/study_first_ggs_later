import 'package:flame/game.dart';

class LoadAllAsset extends FlameGame {

  initAssets() async {
    await images.load('hourglass.png');
  }
}
