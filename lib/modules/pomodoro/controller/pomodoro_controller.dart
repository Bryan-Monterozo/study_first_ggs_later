import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_get_controller.dart';
import 'package:study_first_ggs_later/modules/pomodoro/models/pomodoro_status.dart';
import 'package:study_first_ggs_later/modules/pomodoro/view/screens/pomodoro.dart';

class PomodoroController extends GetxController {
  //variables
  RxInt pomPoints = 0.obs;

  pomodoroPoints(int i) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int x = prefs.getInt('pomodoroPoints') ?? 0;
    print('pomodoroPoints');
    await prefs.setInt('pomodoroPoints', x + i);
    print(prefs.getInt('pomodoroPoints'));
    BattleController().battlePoints();
  }
}
