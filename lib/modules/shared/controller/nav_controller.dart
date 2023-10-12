import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_first_ggs_later/core/constants/route.dart';

class NavController extends GetxController {
  var currentNav = CurrentRoute.home.obs;
  var currentNavString = ''.obs;
  CurrentRoute currentRoute = CurrentRoute.home;

  void changeNav() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    currentNavString.value = EnumToString.convertToString(currentNav.value);
    await prefs.setString('currentNav', currentNavString.value);
    currentNav.value = EnumToString.fromString(CurrentRoute.values, currentNavString.value)!;
    debugPrint('currentNavString.value: ${currentNavString.value}');
    debugPrint('currentNav.value: ${currentNav.value}');
  }

  void initNav({
    required CurrentRoute currentRoute,
  }) async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: unused_local_variable
    final String? currentNavString = prefs.getString('currentNav');
    currentNav.value = currentRoute;
    changeNav();
  }

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
