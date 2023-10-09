import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/calendar/view/screens/calendar.dart';
import 'package:study_first_ggs_later/modules/home/view/screens/home.dart';
import 'package:study_first_ggs_later/modules/pomodoro/view/screens/pomodoro.dart';
import 'package:study_first_ggs_later/modules/quiz/view/screens/quiz.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer.dart';
import 'package:study_first_ggs_later/modules/shared/widgets/drawer_widgets.dart';
import 'package:study_first_ggs_later/modules/todo/view/screens/todo.dart';
// import 'package:study_first_ggs_later/modules/calendar/view/screens/calendar.dart';
// import 'package:study_first_ggs_later/modules/pomodoro/view/screens/pomodoro.dart';
// import 'package:study_first_ggs_later/modules/quiz/view/screens/quiz.dart';
// import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer.dart';
// import 'package:study_first_ggs_later/modules/todo/view/screens/todo.dart';

//TODO: Remove Back Button on drawer OR make it go back to the previous screen
//      ORRRR make the hamborgir sharable across all screens with index and shaded

class NavDrawer extends StatelessWidget {
  // final List<Widget> _screens = const <Widget>[
  //   StudyHome(),
  //   Pomodoro(),
  // ];

  // int selectedIndex = 0;

  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: 270,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 24),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.book_online_rounded,
                          color: Color(0xFF0B6BA7),
                          size: 32,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Text(
                            'Study First',
                            style: TextStyle(
                              fontFamily: 'Product Sans',
                              color: Color(0xFF15161E),
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StudyHome(),
                          ),
                        );
                      },
                      child: const DrawerNavButton(
                        navText: 'Home',
                        navIcon: Icons.home_outlined,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Pomodoro(),
                          ),
                        );
                      },
                      child: const DrawerNavButton(
                        navText: 'Pomodoro',
                        navIcon: Icons.timer_outlined,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StudyCalendar(),
                          ),
                        );
                      },
                      child: const DrawerNavButton(
                        navText: 'Calendar',
                        navIcon: Icons.calendar_month_outlined,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StudyToDo(),
                          ),
                        );
                      },
                      child: const DrawerNavButton(
                        navText: 'To Do',
                        navIcon: Icons.checklist_outlined,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StudyReviewer(),
                          ),
                        );
                      },
                      child: const DrawerNavButton(
                        navText: 'Reviewer',
                        navIcon: Icons.my_library_books_outlined,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StudyQuiz(),
                          ),
                        );
                      },
                      child: const DrawerNavButton(
                        navText: 'Quiz',
                        navIcon: Icons.quiz_outlined,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: NavBarStatus(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}