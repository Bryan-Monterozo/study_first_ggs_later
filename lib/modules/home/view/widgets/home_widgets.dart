import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeNavButtonWidget extends StatelessWidget {
  final Color? homeNavColor;
  final Color? homeNavColorText;
  final double? homeNavHeight;
  final double? homeNavWidth;
  final Widget? homeNavText;
  final Widget navContent;

  const HomeNavButtonWidget(
      {super.key,
      this.homeNavColor,
      this.homeNavColorText,
      this.homeNavHeight,
      this.homeNavWidth,
      this.homeNavText,
      required this.navContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: homeNavWidth,
      height: homeNavHeight,
      decoration: BoxDecoration(
        color: homeNavColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Align(
        alignment: const AlignmentDirectional(0.00, 0.00),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            homeNavText!,
            navContent,
          ],
        ),
      ),
    );
  }
}

class HomeNavGetStarted extends StatelessWidget {
  final Color? homeNavColor;
  final Color? homeNavColorText;
  final double? homeNavHeight;
  final double? homeNavWidth;
  final String? homeNavText;

  const HomeNavGetStarted(
      {super.key,
      this.homeNavColor,
      this.homeNavColorText,
      this.homeNavHeight,
      this.homeNavWidth,
      this.homeNavText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: homeNavWidth,
      height: homeNavHeight,
      decoration: BoxDecoration(
        color: homeNavColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Align(
        alignment: const AlignmentDirectional(0.00, 0.00),
        child: Text(
          homeNavText!,
          style: TextStyle(
            fontFamily: 'Poppins',
            color: homeNavColorText!,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class HomeNavGesture extends StatelessWidget {
  final Widget? navigator;
  final Widget? navContainer;

  const HomeNavGesture({
    super.key,
    this.navigator,
    this.navContainer,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => navigator!,
          ),
        );
      },
      child: navContainer,
    );
  }
}

Widget homeCalendar() {
  return TableCalendar(
    calendarStyle: (const CalendarStyle(
      cellMargin: EdgeInsets.all(0.0),
      defaultTextStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 8,
        color: Color(0xFF0B6BA7),
      ),
      outsideTextStyle: TextStyle(
          fontFamily: 'Poppins', fontSize: 8, color: Colors.transparent),
      todayTextStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 8,
        color: Colors.white,
      ),
      weekendTextStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 8,
        color: Color(0xFF0B6BA7),
      ),
      todayDecoration: BoxDecoration(
        color: Color(0xFF0B6BA7),
        shape: BoxShape.circle,
      ),
    )),
    locale: "en_US",
    rowHeight: 21,
    daysOfWeekStyle: const DaysOfWeekStyle(
      weekdayStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 8,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0B6BA7),
      ),
      weekendStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 8,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0B6BA7),
      ),
    ),
    headerStyle: const HeaderStyle(
      formatButtonVisible: false,
      headerPadding: EdgeInsets.symmetric(vertical: 0.0),
      leftChevronMargin: EdgeInsets.all(0.0),
      leftChevronIcon: Icon(
        Icons.chevron_left_rounded,
        color: Color(0xFF0B6BA7),
      ),
      rightChevronIcon: Icon(
        Icons.chevron_right_rounded,
        color: Color(0xFF0B6BA7),
      ),
      titleCentered: true,
      titleTextStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0B6BA7),
      ),
    ),
    availableGestures: AvailableGestures.horizontalSwipe,
    focusedDay: DateTime.now(),
    firstDay: DateTime.utc(2010, 10, 16),
    lastDay: DateTime.utc(2030, 3, 14),
    startingDayOfWeek: StartingDayOfWeek.monday,
  );
}
