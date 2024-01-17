import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_get_controller.dart';

class FcController extends GetxController {
  RxInt flipPoints = 0.obs;
  RxInt totalFlipPoints = 0.obs;

  flippedPoints() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('flippedPoints');
    flipPoints.value = prefs.getInt('flipPoints') ?? 0;
    totalFlipPoints.value = prefs.getInt('totalFlipPoints') ?? 0;
    if (flipPoints.value < 3) {
      await prefs.setInt('flipPoints', (prefs.getInt('flipPoints')??0) + 1);
    } else {
      await prefs.setInt('totalFlipPoints', (prefs.getInt('totalFlipPoints')??0) + 1);
      await prefs.setInt('flipPoints', 0);
    }
    print(prefs.getInt('flipPoints'));
    print(prefs.getInt('totalFlipPoints'));
    BattleController().battlePoints();
  }
}