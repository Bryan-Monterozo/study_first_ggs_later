import 'package:get/get.dart';
import 'package:study_first_ggs_later/core/constants/route.dart';

class NavController extends GetxController {
  final currentNav = CurrentRoute.home.obs;
  CurrentRoute currentRoute = CurrentRoute.home;

  // final RxList currNav = [
  //   'Home',
  //   'Todo',
  //   'Calendar',
  //   'Pomodoro',
  //   'Quiz',
  //   'Reviewer',
  // ].obs;

  // RxBool isCurrentRoute = true.obs;
  // RxBool isNotCurrentRoute = false.obs;

  void unSelectRoute() {
    // isNotCurrentRoute.value == false;
  }
}
