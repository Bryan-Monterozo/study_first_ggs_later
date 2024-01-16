import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/core/constants/route.dart';
import 'package:study_first_ggs_later/modules/calendar/view/screens/calendar.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_get_controller.dart';
import 'package:study_first_ggs_later/modules/game/view/screens/game_home_play.dart';
import 'package:study_first_ggs_later/modules/home/view/widgets/home_widgets.dart';
import 'package:study_first_ggs_later/modules/pomodoro/view/screens/pomodoro.dart';
import 'package:study_first_ggs_later/modules/quiz/view/screens/quiz_catalogue.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer.dart';
import 'package:study_first_ggs_later/modules/shared/controller/nav_controller.dart';
import 'package:study_first_ggs_later/modules/shared/home_app_bar.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';
import 'package:study_first_ggs_later/modules/todo/view/screens/todo.dart';

class StudyHome extends StatelessWidget {
  static const String routeName = '/';
  const StudyHome({super.key});

  @override
  Widget build(BuildContext context) {
    NavController navController = Get.put(NavController());
    navController.initNav(
      currentRoute: CurrentRoute.home,
    );
    Get.delete<PlayerController>();
    Get.delete<BattleController>();
    Get.put(PlayerController());
    Get.put(BattleController());
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: HomeAppBar(
        leading: leadingTitle(context),
        title: "",
        withPic: withHPic(context),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              const HomeNavGesture(
                navigator: GameHomePlay(),
                navContainer: HomeNavButtonWidget(
                  navText: 'Game',
                  navDesc: 'Notifications!',
                  navColor: Color(0xff009598),
                  navPic: kIsWeb
                      ? 'assets/images/time-management.png'
                      : 'assets/images/time-management.png',
                ),
              ),
              const HomeNavGesture(
                navigator: Pomodoro(),
                navContainer: HomeNavButtonWidget(
                  navText: 'Pomodoro',
                  navDesc: 'Notifications!',
                  navColor: Color(0xff009598),
                  navPic: kIsWeb
                      ? 'assets/images/time-management.png'
                      : 'assets/images/time-management.png',
                ),
              ),
              HomeNavGesture(
                navigator: StudyCalendar(),
                navContainer: const HomeNavButtonWidget(
                  navText: 'Calendar',
                  navDesc: 'Notifications!',
                  navColor: Color(0xffFFAB91),
                  navPic: kIsWeb
                      ? 'assets/images/calendar.png'
                      : 'assets/images/calendar.png',
                ),
              ),
              HomeNavGesture(
                navigator: StudyToDo(),
                navContainer: const HomeNavButtonWidget(
                  navText: 'To Do',
                  navDesc: 'Notifications',
                  navColor: Color(0xffB388FF),
                  navPic: kIsWeb
                      ? 'assets/images/to-do-list.png'
                      : 'assets/images/to-do-list.png',
                ),
              ),
              HomeNavGesture(
                navigator: StudyReviewer(),
                navContainer: const HomeNavButtonWidget(
                  navText: 'Reviewer',
                  navDesc: 'Notifications!',
                  navColor: Color(0xffFF8A80),
                  navPic: kIsWeb
                      ? 'assets/images/reviewer.png'
                      : 'assets/images/reviewer.png',
                ),
              ),
              const HomeNavGesture(
                navigator: QuizCatalogue(),
                navContainer: HomeNavButtonWidget(
                  navText: 'Quiz',
                  navDesc: 'Notifications!',
                  navColor: Color(0xffB388FF),
                  navPic: kIsWeb
                      ? 'assets/images/quiz.png'
                      : 'assets/images/quiz.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
