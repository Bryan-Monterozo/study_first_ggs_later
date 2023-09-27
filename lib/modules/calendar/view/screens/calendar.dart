import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';

class StudyCalendar extends StatelessWidget {
  const StudyCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavDrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey[500]),
          title: const Text(
            'Calendar',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  'Calendar',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
            ],
          ),
          ),
        );
  }
}