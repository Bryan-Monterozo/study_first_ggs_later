import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/calendar/view/screens/calendar.dart';
import 'package:study_first_ggs_later/modules/pomodoro/view/screens/pomodoro.dart';
import 'package:study_first_ggs_later/modules/home/view/screens/home.dart';
import 'package:study_first_ggs_later/modules/quiz/view/screens/quiz.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer.dart';
import 'package:study_first_ggs_later/modules/todo/view/screens/todo.dart';

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
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.orange,
              ),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  )
                ],
              )),
          ListTile(
            title: const Text(
              'Home',
              style: TextStyle(fontSize: 20),
            ),
            leading: const Icon(
              Icons.home,
              size: 20,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const StudyHome(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Pomodoro',
              style: TextStyle(fontSize: 20),
            ),
            leading: const Icon(
              Icons.timer_outlined,
              size: 20,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Pomodoro(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Calendar',
              style: TextStyle(fontSize: 20),
            ),
            leading: const Icon(
              Icons.calendar_month_outlined,
              size: 20,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const StudyCalendar(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text(
              'To Do',
              style: TextStyle(fontSize: 20),
            ),
            leading: const Icon(
              Icons.checklist_outlined,
              size: 20,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const StudyToDo(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Reviewer',
              style: TextStyle(fontSize: 20),
            ),
            leading: const Icon(
              Icons.my_library_books_outlined,
              size: 20,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const StudyReviewer(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Take a Quiz',
              style: TextStyle(fontSize: 20),
            ),
            leading: const Icon(
              Icons.quiz_outlined,
              size: 20,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const StudyQuiz(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
