import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/calendar/view/screens/calendar.dart';
import 'package:study_first_ggs_later/modules/home/view/widgets/home_widgets.dart';
import 'package:study_first_ggs_later/modules/pomodoro/view/screens/pomodoro.dart';
import 'package:study_first_ggs_later/modules/quiz/view/screens/quiz.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';
import 'package:study_first_ggs_later/modules/todo/view/screens/todo.dart';

class StudyHome extends StatefulWidget {
  const StudyHome({super.key});

  @override
  State<StudyHome> createState() => _HomeState();
}

class _HomeState extends State<StudyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: SharedAppBar(
        titlePic: titlePic(context),
        withPic: withPic(context),
      ),
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              HomeNavGesture(
                navigator: Pomodoro(),
                navContainer: HomeNavButtonWidget(
                  navText: 'POMODORO',
                  navDesc:
                      'Supercharge your \nproductivity with our \nPomodoro technic',
                  navColor: Color(0xFF818C80),
                  navPic: 'assets/images/pomodoro.png',
                ),
              ),
              HomeNavGesture(
                navigator: StudyCalendar(),
                navContainer: HomeNavButtonWidget(
                  navText: 'CALENDAR',
                  navDesc:
                      'Master your schedule \neffortlessly with our \nuser-friendly \ncalendar app.',
                  navColor: Color(0xFF7E7F7A),
                  navPic: 'assets/images/calendar.png',
                ),
              ),
              HomeNavGesture(
                navigator: StudyToDo(),
                navContainer: HomeNavButtonWidget(
                  navText: 'TO DO',
                  navDesc: 'Unleash your productivity \nwith our to-do app',
                  navColor: Color(0xFF734429),
                  navPic: 'assets/images/to do.png',
                ),
              ),
              HomeNavGesture(
                navigator: StudyReviewer(),
                navContainer: HomeNavButtonWidget(
                  navText: 'REVIEWER',
                  navDesc: 'Elevate your studies \nwith our Reviewer tool',
                  navColor: Color(0xFF405568),
                  navPic: 'assets/images/reviewer.png',
                ),
              ),
              HomeNavGesture(
                navigator: StudyQuiz(),
                navContainer: HomeNavButtonWidget(
                  navText: 'QUIZ',
                  navDesc: 'Take a quiz, \nchallenge yourself.',
                  navColor: Color(0xFF598F78),
                  navPic: 'assets/images/quiz.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
