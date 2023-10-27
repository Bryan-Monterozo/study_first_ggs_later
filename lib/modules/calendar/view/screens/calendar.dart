import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/core/constants/route.dart';
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
  final NavController navController = Get.put(NavController());
  StudyCalendar({super.key});

  @override
  State<StudyCalendar> createState() => _StudyCalendarState();
}

class _StudyCalendarState extends State<StudyCalendar> {
  CalendarController _controller = CalendarController();
  CalendarView calendarView = CalendarView.month;

  @override
  void initState() {
    widget.navController.initNav(
      currentRoute: CurrentRoute.calendar,
    );
    _controller = CalendarController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<MeetingProvider>(context).meetings;
    return Scaffold(
        drawer: const NavDrawer(),
        appBar: SharedAppBar(
          titlePic: titlePic(context),
          withPic: withPic(context),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => EventEditingPage()))
        ),
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
                dataSource: MeetingDataSource(events),
                controller: _controller,
                monthViewSettings: const MonthViewSettings(
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.indicator,
                    showAgenda: true),
                initialSelectedDate: DateTime.now(),
                onLongPress: (details) {
                  final provider = Provider.of<MeetingProvider>(context, listen: false);

                  provider.setDate(details.date!);
                  showModalBottomSheet(context: context, builder: (context) => const TasksWidget(),);
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
}
