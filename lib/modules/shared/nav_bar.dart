import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/core/constants/route.dart';
import 'package:study_first_ggs_later/modules/calendar/view/screens/calendar.dart';
import 'package:study_first_ggs_later/modules/home/view/screens/home.dart';
import 'package:study_first_ggs_later/modules/pomodoro/view/screens/pomodoro.dart';
import 'package:study_first_ggs_later/modules/quiz/view/screens/quiz.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer.dart';
import 'package:study_first_ggs_later/modules/shared/controller/nav_controller.dart';
import 'package:study_first_ggs_later/modules/shared/widgets/drawer_widgets.dart';
import 'package:study_first_ggs_later/modules/todo/view/screens/todo.dart';

//TODO: Remove Back Button on drawer OR make it go back to the previous screen
//      ORRRR make the hamborgir sharable across all screens with index and shaded

class NavDrawer extends StatelessWidget {
  // final NavController navController = Get.put(NavController());
  // final List<Widget> _screens = const <Widget>[
  //   StudyHome(),
  //   Pomodoro(),
  // ];

  // int selectedIndex = 0;

  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final NavController navController = Get.put(NavController());

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
                  Obx(
                    () => Padding(
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
                        child: DrawerNavButton(
                          navText: navController.currentNav.value == CurrentRoute.home
                        ? const Text(
                          'Home',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                        : const Text(
                          'Home',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            color: Color(0xff1c1c1c),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                          navIcon: navController.currentNav.value ==
                                  CurrentRoute.home
                              ? const Icon(
                                  Icons.home_outlined,
                                  color: Colors.white,
                                  size: 24,
                                )
                              : const Icon(
                                  Icons.home_outlined,
                                  color: Color(0xFF15161E),
                                  size: 24,
                                ),
                          navColor: navController.currentNav.value ==
                                  CurrentRoute.home
                              ? const Color(0xFF0B6BA7)
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Padding(
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
                        child: DrawerNavButton(
                          navText: navController.currentNav.value == CurrentRoute.pomodoro
                        ? const Text(
                          'Pomodoro',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                        : const Text(
                          'Pomodoro',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            color: Color(0xff1c1c1c),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                          navIcon: navController.currentNav.value ==
                                  CurrentRoute.pomodoro
                              ? const Icon(
                                  Icons.timer_outlined,
                                  color: Colors.white,
                                  size: 24,
                                )
                              : const Icon(
                                  Icons.timer_outlined,
                                  color: Color(0xFF15161E),
                                  size: 24,
                                ),
                          navColor: navController.currentNav.value ==
                                  CurrentRoute.pomodoro
                              ? const Color(0xFF0B6BA7)
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                    child: GestureDetector(
                      onTap: () {
                        navController.currentNav.value = CurrentRoute.calendar;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudyCalendar(),
                          ),
                        );
                      },
                      child: DrawerNavButton(
                        navText: navController.currentNav.value == CurrentRoute.calendar
                        ? const Text(
                          'Calendar',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                        : const Text(
                          'Calendar',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            color: Color(0xff1c1c1c),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        navIcon: navController.currentNav.value ==
                                CurrentRoute.calendar
                            ? const Icon(
                                Icons.calendar_month_outlined,
                                color: Colors.white,
                                size: 24,
                              )
                            : const Icon(
                                Icons.calendar_month_outlined,
                                color: Color(0xFF15161E),
                                size: 24,
                              ),
                        navColor: navController.currentNav.value ==
                                CurrentRoute.calendar
                            ? const Color(0xFF0B6BA7)
                            : Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                    child: GestureDetector(
                      onTap: () {
                        navController.currentNav.value = CurrentRoute.todo;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudyToDo(),
                          ),
                        );
                      },
                      child: DrawerNavButton(
                        navText: navController.currentNav.value == CurrentRoute.todo
                        ? const Text(
                          'To Do',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                        : const Text(
                          'To Do',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            color: Color(0xff1c1c1c),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        navIcon:
                            navController.currentNav.value == CurrentRoute.todo
                                ? const Icon(
                                    Icons.checklist_outlined,
                                    color: Colors.white,
                                    size: 24,
                                  )
                                : const Icon(
                                    Icons.checklist_outlined,
                                    color: Color(0xFF15161E),
                                    size: 24,
                                  ),
                        navColor:
                            navController.currentNav.value == CurrentRoute.todo
                                ? const Color(0xFF0B6BA7)
                                : Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                    child: GestureDetector(
                      onTap: () {
                        navController.currentNav.value = CurrentRoute.reviewer;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudyReviewer(),
                          ),
                        );
                      },
                      child: DrawerNavButton(
                        navText: navController.currentNav.value == CurrentRoute.reviewer
                        ? const Text(
                          'Reviewer',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                        : const Text(
                          'Reviewer',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            color: Color(0xff1c1c1c),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        navIcon: navController.currentNav.value ==
                                CurrentRoute.reviewer
                            ? const Icon(
                                Icons.my_library_books_outlined,
                                color: Colors.white,
                                size: 24,
                              )
                            : const Icon(
                                Icons.my_library_books_outlined,
                                color: Color(0xFF15161E),
                                size: 24,
                              ),
                        navColor: navController.currentNav.value ==
                                CurrentRoute.reviewer
                            ? const Color(0xFF0B6BA7)
                            : Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                    child: GestureDetector(
                      onTap: () {
                        navController.currentNav.value = CurrentRoute.quiz;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudyQuiz(),
                          ),
                        );
                      },
                      child: DrawerNavButton(
                        navText: navController.currentNav.value == CurrentRoute.quiz
                        ? const Text(
                          'Quiz',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                        : const Text(
                          'Quiz',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            color: Color(0xff1c1c1c),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        navIcon:
                            navController.currentNav.value == CurrentRoute.quiz
                                ? const Icon(
                                    Icons.quiz_outlined,
                                    color: Colors.white,
                                    size: 24,
                                  )
                                : const Icon(
                                    Icons.quiz_outlined,
                                    color: Color(0xFF15161E),
                                    size: 24,
                                  ),
                        navColor:
                            navController.currentNav.value == CurrentRoute.quiz
                                ? const Color(0xFF0B6BA7)
                                : Colors.white,
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
