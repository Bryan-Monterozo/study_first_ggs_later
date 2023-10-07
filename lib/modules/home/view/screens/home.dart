import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';

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
      body:  Center(
      child: SingleChildScrollView(
        child: Column(
        mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
              child: Container(
                width: 400,
                height: 150,
                decoration: BoxDecoration(
                  color: Color(0xFF818C80),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 24, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Text(
                              'POMODORO',
                              style: TextStyle(fontSize: 25, color: Colors.white,)
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Text(
                              'Supercharge your \nproductivity with our \nPomodoro technique',
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 12, color: Colors.white,)
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'assets/images/pomodoro.png',
                          width: 150,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
              child: Container(
                width: 400,
                height: 150,
                decoration: BoxDecoration(
                  color: Color(0xFF7E7F7A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 24, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Text(
                              'CALENDAR',
                              style: TextStyle(fontSize: 25, color: Colors.white,)
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Text(
                              'Master your schedule \neffortlessly with our \nuser-friendly \ncalendar app.',
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 12, color: Colors.white,)
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'assets/images/calendar.png',
                          width: 200,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
              child: Container(
                width: 400,
                height: 150,
                decoration: BoxDecoration(
                  color: Color(0xFF734429),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 24, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Text(
                              'TO DO',
                              style: TextStyle(fontSize: 25, color: Colors.white,)
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Text(
                              'Unleash your productivity \nwith our to-do app',
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 12, color: Colors.white,)
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'assets/images/to do.png',
                          width: 200,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
              child: Container(
                width: 400,
                height: 150,
                decoration: BoxDecoration(
                  color: Color(0xFF405568),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 24, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Text(
                              'REVIEWER',
                              style: TextStyle(fontSize: 25, color: Colors.white,)
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Text(
                              'Elevate your studies \nwith our Reviewer tool',
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 12, color: Colors.white,)
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'assets/images/reviewer.png',
                          width: 200,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
              child: Container(
                width: 400,
                height: 150,
                decoration: BoxDecoration(
                  color: Color(0xFF598F78),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 24, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Text(
                              'QUIZ',
                              style: TextStyle(fontSize: 25, color: Colors.white,)
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Text(
                              'Take a quiz, \nchallenge yourself.',
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 12, color: Colors.white,)
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'assets/images/quiz.png',
                          width: 200,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      ),
  );
  }
}
