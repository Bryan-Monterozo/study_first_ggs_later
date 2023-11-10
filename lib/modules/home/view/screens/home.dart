import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/core/constants/reviwer_notes_colors.dart';
import 'package:study_first_ggs_later/core/constants/route.dart';
import 'package:study_first_ggs_later/modules/calendar/view/screens/calendar.dart';
import 'package:study_first_ggs_later/modules/home/view/widgets/home_widgets.dart';
import 'package:study_first_ggs_later/modules/pomodoro/view/screens/pomodoro.dart';
import 'package:study_first_ggs_later/modules/quiz/view/screens/quiz.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/shared/controller/nav_controller.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';
import 'package:study_first_ggs_later/modules/todo/view/screens/todo.dart';

class StudyHome extends StatefulWidget {
  static const String routeName = '/';
  const StudyHome({super.key});

  @override
  State<StudyHome> createState() => _HomeState();
}

class _HomeState extends State<StudyHome> {
  NavController navController = Get.put(NavController());

  @override
  void initState() {
    navController.initNav(
      currentRoute: CurrentRoute.home,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: SharedAppBar(
        withPic: withPic(context),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  Text("Hello User06969,",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C2929),
                      )),
                ],
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
              const HomeNavGesture(
                navigator: StudyToDo(),
                navContainer: HomeNavButtonWidget(
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
              HomeNavGesture(
                navigator: StudyQuiz(),
                navContainer: const HomeNavButtonWidget(
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
