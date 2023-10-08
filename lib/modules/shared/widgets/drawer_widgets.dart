import 'package:flutter/material.dart';

//TODO: Place Holder muna mga to dapat yung mga title, and eme is maging object for reusability
// @jhnpaulogrc kaw mag aayos nito

class DrawerHome extends StatelessWidget {
  
  const DrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: @jhnpaulogrc naka return Container() muna to for the meantime pero dapat
    //proper widgets nato bale hihimayin mo yung laman nito para madli mag debug
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFFF1F4F8),
        borderRadius: BorderRadius.circular(12),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 12, 12),
              child: Container(
                width: 4,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFF6F61EF),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const Icon(
              Icons.home_outlined,
              color: Color(0xFF15161E),
              size: 28,
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
              child: Text(
                'Home',
                style: TextStyle(
                  fontFamily: 'Product Sans',
                  color: Color(0xff1c1c1c),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerPomodoro extends StatelessWidget {
  const DrawerPomodoro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(
                  0, 12, 12, 12),
              child: Container(
                width: 4,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFFF1F4F8),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const Icon(
              Icons.timer_outlined,
              color: Color(0xFF606A85),
              size: 28,
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
              child: Text(
                'Pomodoro',
                style: TextStyle(
                  fontFamily: 'Product Sans',
                  color: Color(0xFF606A85),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerCalendar extends StatelessWidget {
  const DrawerCalendar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(
                  0, 12, 12, 12),
              child: Container(
                width: 4,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFFF1F4F8),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const Icon(
              Icons.calendar_month_outlined,
              color: Color(0xFF606A85),
              size: 28,
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
              child: Text(
                'Calendar',
                style: TextStyle(
                  fontFamily: 'Product Sans',
                  color: Color(0xFF606A85),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerToDo extends StatelessWidget {
  const DrawerToDo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(
                  0, 12, 12, 12),
              child: Container(
                width: 4,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F4F8),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const Icon(
              Icons.checklist_outlined,
              color: Color(0xFF606A85),
              size: 28,
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
              child: Text(
                'To Do',
                style: TextStyle(
                  fontFamily: 'Product Sans',
                  color: Color(0xFF606A85),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerReviewer extends StatelessWidget {
  const DrawerReviewer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(
                  0, 12, 12, 12),
              child: Container(
                width: 4,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F4F8),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const Icon(
              Icons.my_library_books_outlined,
              color: Color(0xFF606A85),
              size: 28,
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
              child: Text(
                'Reviewer',
                style: TextStyle(
                  fontFamily: 'Product Sans',
                  color: Color(0xFF606A85),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerQuiz extends StatelessWidget {
  const DrawerQuiz({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(
                  0, 12, 12, 12),
              child: Container(
                width: 4,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFFF1F4F8),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const Icon(
              Icons.quiz_outlined,
              color: Color(0xFF606A85),
              size: 28,
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
              child: Text(
                'Quiz',
                style: TextStyle(
                  fontFamily: 'Product Sans',
                  color: Color(0xFF606A85),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

