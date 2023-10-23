import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/core/constants/route.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:study_first_ggs_later/modules/shared/controller/nav_controller.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';

class StudyCalendar extends StatefulWidget {
  static const String routeName = '/calendar';
  final NavController navController = Get.put(NavController());
  StudyCalendar({super.key});

  @override
  State<StudyCalendar> createState() => _StudyCalendarState();
}

class _StudyCalendarState extends State<StudyCalendar> {

  @override
  void initState() {
    widget.navController.initNav(
      currentRoute: CurrentRoute.calendar,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: const NavDrawer(),
      appBar: SharedAppBar(
        titlePic: titlePic(context),
        withPic: withPic(context),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Calendar',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SfCalendar(
              view: CalendarView.month,
              firstDayOfWeek: 7,
              dataSource: MeetingDataSource(_getDataSource()),
              monthViewSettings: const MonthViewSettings(
                  appointmentDisplayMode:
                      MonthAppointmentDisplayMode.appointment),
              todayHighlightColor: Colors.red,
              showNavigationArrow: true,
            ),
          ],
        ),
      ),
    );
  }
}

List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting('Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }

  class MeetingDataSource extends CalendarDataSource {
    MeetingDataSource(List<Meeting> source) {
      appointments = source;
    }

    @override
    DateTime getStartTime(int index) {
      return appointments![index].from;
    }

    @override
    DateTime getEndTime(int index) {
      return appointments![index].to;
    }

    @override
    String getSubject(int index) {
      return appointments![index].background;
    }

    @override
    bool isAllDay(int index) {
      return appointments![index].isAllDay;
    }
  }

  class Meeting {
    Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

    String eventName;
    DateTime from;
    DateTime to;
    Color background;
    bool isAllDay;
  }