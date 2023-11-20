import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/core/constants/route.dart';
import 'package:study_first_ggs_later/modules/calendar/view/screens/calendar.dart';
import 'package:study_first_ggs_later/modules/home/view/screens/home.dart';
import 'package:study_first_ggs_later/modules/pomodoro/view/screens/pomodoro.dart';
import 'package:study_first_ggs_later/modules/quiz/view/screens/quiz.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer.dart';
import 'package:study_first_ggs_later/modules/settings/view/screens/settings.dart';
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
              padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.lightbulb_circle_rounded,
                          color: Color(0xFF0B6BA7),
                          size: 36,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Text(
                            'Study First',
                            style: TextStyle(
                              color: Color(0xFF0B6BA7),
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 36, 0, 0),
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
                          navText: navController.currentNav.value ==
                                  CurrentRoute.home
                              ? const Text(
                                  'Home',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF0B6BA7),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              : const Text(
                                  'Home',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xffbcbcbc),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                          navIcon: navController.currentNav.value ==
                                  CurrentRoute.home
                              ? const Icon(
                                  Icons.home_filled,
                                  color: Color(0xFF0B6BA7),
                                  size: 20,
                                )
                              : const Icon(
                                  Icons.home_filled,
                                  color: Color(0xffbcbcbc),
                                  size: 20,
                                ),
                          navShadow: navController.currentNav.value ==
                                  CurrentRoute.home
                              ? const Color(0x33000000)
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
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
                          navText: navController.currentNav.value ==
                                  CurrentRoute.pomodoro
                              ? const Text(
                                  'Pomodoro',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF0B6BA7),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              : const Text(
                                  'Pomodoro',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xffbcbcbc),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                          navIcon: navController.currentNav.value ==
                                  CurrentRoute.pomodoro
                              ? const Icon(
                                  Icons.timer_rounded,
                                  color: Color(0xFF0B6BA7),
                                  size: 20,
                                )
                              : const Icon(
                                  Icons.timer_rounded,
                                  color: Color(0xffbcbcbc),
                                  size: 20,
                                ),
                          navShadow: navController.currentNav.value ==
                                  CurrentRoute.pomodoro
                              ? const Color(0x33000000)
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
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
                        navText: navController.currentNav.value ==
                                CurrentRoute.calendar
                            ? const Text(
                                'Calendar',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF0B6BA7),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            : const Text(
                                'Calendar',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xffbcbcbc),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                        navIcon: navController.currentNav.value ==
                                CurrentRoute.calendar
                            ? const Icon(
                                Icons.calendar_month_rounded,
                                color: Color(0xFF0B6BA7),
                                size: 20,
                              )
                            : const Icon(
                                Icons.calendar_month_rounded,
                                color: Color(0xffbcbcbc),
                                size: 20,
                              ),
                        navShadow: navController.currentNav.value ==
                                CurrentRoute.calendar
                            ? const Color(0x33000000)
                            : Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
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
                        navText:
                            navController.currentNav.value == CurrentRoute.todo
                                ? const Text(
                                    'To Do',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF0B6BA7),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                : const Text(
                                    'To Do',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xffbcbcbc),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                        navIcon:
                            navController.currentNav.value == CurrentRoute.todo
                                ? const Icon(
                                    Icons.library_add_check_rounded,
                                    color: Color(0xFF0B6BA7),
                                    size: 20,
                                  )
                                : const Icon(
                                    Icons.library_add_check_rounded,
                                    color: Color(0xffbcbcbc),
                                    size: 20,
                                  ),
                        navShadow:
                            navController.currentNav.value == CurrentRoute.todo
                                ? const Color(0x33000000)
                                : Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
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
                        navText: navController.currentNav.value ==
                                CurrentRoute.reviewer
                            ? const Text(
                                'Reviewer',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF0B6BA7),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            : const Text(
                                'Reviewer',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xffbcbcbc),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                        navIcon: navController.currentNav.value ==
                                CurrentRoute.reviewer
                            ? const Icon(
                                Icons.my_library_books_rounded,
                                color: Color(0xFF0B6BA7),
                                size: 20,
                              )
                            : const Icon(
                                Icons.my_library_books_rounded,
                                color: Color(0xffbcbcbc),
                                size: 20,
                              ),
                        navShadow: navController.currentNav.value ==
                                CurrentRoute.reviewer
                            ? const Color(0x33000000)
                            : Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
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
                        navText:
                            navController.currentNav.value == CurrentRoute.quiz
                                ? const Text(
                                    'Quiz',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF0B6BA7),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                : const Text(
                                    'Quiz',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xffbcbcbc),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                        navIcon:
                            navController.currentNav.value == CurrentRoute.quiz
                                ? const Icon(
                                    Icons.quiz_rounded,
                                    color: Color(0xFF0B6BA7),
                                    size: 20,
                                  )
                                : const Icon(
                                    Icons.quiz_rounded,
                                    color: Color(0xffbcbcbc),
                                    size: 20,
                                  ),
                        navShadow:
                            navController.currentNav.value == CurrentRoute.quiz
                                ? const Color(0x33000000)
                                : Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                    child: GestureDetector(
                      onTap: () {
                        navController.currentNav.value = CurrentRoute.settings;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudySettings(),
                          ),
                        );
                      },
                      child: DrawerNavButton(
                        navText: navController.currentNav.value ==
                                CurrentRoute.settings
                            ? const Text(
                                'Settings',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF0B6BA7),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            : const Text(
                                'Settings',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xffbcbcbc),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                        navIcon: navController.currentNav.value ==
                                CurrentRoute.settings
                            ? const Icon(
                                Icons.settings_suggest,
                                color: Color(0xFF0B6BA7),
                                size: 20,
                              )
                            : const Icon(
                                Icons.settings_suggest,
                                color: Color(0xffbcbcbc),
                                size: 20,
                              ),
                        navShadow: navController.currentNav.value ==
                                CurrentRoute.settings
                            ? const Color(0x33000000)
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
