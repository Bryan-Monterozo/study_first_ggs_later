import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/pomodoro/view/screens/pomodoro.dart';

class PomodoroController extends GetxController {

  getSetTimer() {
    Get.off(const Pomodoro());
  }  
}
