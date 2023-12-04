import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/core/constants/route.dart';
import 'package:study_first_ggs_later/modules/calendar/controller/calendar_get_controller.dart';
import 'package:study_first_ggs_later/modules/calendar/models/calendar_model.dart';
import 'event_viewing_page.dart';
import 'package:study_first_ggs_later/modules/calendar/view/screens/meeting_data_source.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:study_first_ggs_later/modules/shared/controller/nav_controller.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';
import 'event_adding_page.dart';

class StudyCalendar extends StatefulWidget {
  static const String routeName = '/calendar';
  final NavController navController = Get.put(NavController());
  StudyCalendar({super.key});

  @override
  State<StudyCalendar> createState() => StudyCalendarState();
}

class StudyCalendarState extends State<StudyCalendar> {
  CalendarController _controller = CalendarController();
  CalendarView calendarView = CalendarView.month;
  MeetingDataSource? events;
  CalendarGetController calendarController = Get.put(CalendarGetController());

  @override
  void initState() {
    widget.navController.initNav(
      currentRoute: CurrentRoute.calendar,
    );
    getDataFromFireStore().then((results) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {});
      });
    });
    _controller = CalendarController();
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
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const EventAddingPage()))),
      body: GetBuilder<CalendarGetController>(
        init: CalendarGetController(),
        id: 'calendarView',
        builder: (controller) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Column(
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
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        calendarView = CalendarView.month;
                        _controller.view = calendarView;
                      });
                    },
                    child: const Text("Month View")),
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        calendarView = CalendarView.week;
                        _controller.view = calendarView;
                      });
                    },
                    child: const Text("Week View")),
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        calendarView = CalendarView.day;
                        _controller.view = calendarView;
                      });
                    },
                    child: const Text("Day View"))
              ],
            ),
            Expanded(
              child: SfCalendar(
                view: calendarView,
                firstDayOfWeek: 7,
                dataSource: events,
                controller: _controller,
                monthViewSettings: const MonthViewSettings(
                    appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
                    showAgenda: true),
                initialSelectedDate: DateTime.now(),
                onLongPress: (details) {
                  final meeting = details.appointments!.first;
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          EventViewingPage(calendarModel: meeting)));
                },
                todayHighlightColor: Colors.blue,
                selectionDecoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.green, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  shape: BoxShape.rectangle,
                ),
                cellBorderColor: Colors.transparent,
                showNavigationArrow: true,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> getDataFromFireStore() async {
    final firestore = FirebaseFirestore.instance;
    var snapShotsValue = await firestore.collection('Calendar').get();
    List<CalendarModel> list = snapShotsValue.docs
        .map((e) => CalendarModel(
              eventName: e.data()['eventName'],
              eventDescription: e.data()['eventDescription'],
              from: (e.data()['from']),
              to: (e.data()['to']),
              isAllDay: e.data()['isAllDay'],
              eventID: e.data()['eventID'],
            ))
        .toList();
    setState(() {
      events = MeetingDataSource(list);
    });
  }
}