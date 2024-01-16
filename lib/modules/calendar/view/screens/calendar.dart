import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:study_first_ggs_later/core/constants/route.dart';
import 'package:study_first_ggs_later/modules/calendar/models/calendar_model.dart';
import 'package:study_first_ggs_later/modules/calendar/view/screens/meeting.dart';
import 'package:study_first_ggs_later/modules/calendar/view/screens/meeting_data_source.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:study_first_ggs_later/modules/shared/controller/nav_controller.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';
import 'package:provider/provider.dart';
import 'event_editing_page.dart';
import 'meeting_tasks.dart';
import 'meeting_provider.dart';

class StudyCalendar extends StatefulWidget {
  static const String routeName = '/calendar';
  StudyCalendar({super.key});

  @override
  State<StudyCalendar> createState() => _StudyCalendarState();
}

class _StudyCalendarState extends State<StudyCalendar> {
  CalendarController _controller = CalendarController();
  CalendarView calendarView = CalendarView.month;
  MeetingDataSource? events;
  final NavController navController = Get.put(NavController());

  @override
  void initState() {
    navController.initNav(
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
    // final events = Provider.of<MeetingProvider>(context).meetings;

    return Scaffold(
      drawer: const NavDrawer(),
      appBar: SharedAppBar(
        titlePic: titlePic(context),
        withPic: withPic(context),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => Get.to(const EventEditingPage())),
      body: Column(
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
                final provider =
                    Provider.of<MeetingProvider>(context, listen: false);

                provider.setDate(details.date!);
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const TasksWidget(),
                );
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
    );
  }

  Future<void> getDataFromFireStore() async {
    // final DateTime stringToDate = DateTime.parse(noteModel!.timeCreated);
    // final String dateCreated = DateFormat('dd/MM/yyyy HH:mm:ss').format(stringToDate);
    final firestore = FirebaseFirestore.instance;
    var snapShotsValue = await firestore.collection('Calendar').get();

    // snapShotsValue.docs.forEach((element) {
    //   debugPrint(element.data().toString());
    // });

    // final Random random = new Random();
    List<Meeting> list = snapShotsValue.docs
        .map((e) => Meeting(
              eventName: e.data()['eventName'],
              eventDescription: e.data()['eventDescription'],
              from: DateFormat('dd-MM-yyyy HH:mm:ss').parse(e.data()['from']),
              // DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch((e.data()['from']) * 1000)),
              // DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.parse(e.data()['from'])),
              to: DateFormat('dd-MM-yyyy HH:mm:ss').parse(e.data()['to']),
              // DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.parse(e.data()['to'])),
              background: Colors.red,
              isAllDay: e.data()['isAllDay'],
            ))
        .toList();
    setState(() {
      events = MeetingDataSource(list);
      debugPrint(list[1].toString());
      debugPrint(list[2].toString());
    });
  }
}
