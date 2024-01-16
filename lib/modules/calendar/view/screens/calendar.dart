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
  bool isPressedMonth = true;
  bool isPressedWeek = false;
  bool isPressedDay = false;

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
        title: 'Calendar',
        withPic: withPic(context),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const EventAddingPage()))),
      body: GetBuilder<CalendarGetController>(
        init: CalendarGetController(),
        id: 'calendarView',
        builder: (controller) => Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: isPressedMonth
                              ? const Color(0xFF0B6BA7)
                              : Colors.transparent),
                      onPressed: () {
                        setState(() {
                          isPressedMonth = true;
                          isPressedWeek = false;
                          isPressedDay = false;
                          calendarView = CalendarView.month;
                          _controller.view = calendarView;
                        });
                      },
                      child: isPressedMonth
                          ? const Text(
                              "Month View",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          : const Text(
                              "Month View",
                              style: TextStyle(
                                color: Color(0xFF0B6BA7),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: isPressedWeek
                              ? const Color(0xFF0B6BA7)
                              : Colors.transparent),
                      onPressed: () {
                        setState(() {
                          isPressedMonth = false;
                          isPressedWeek = true;
                          isPressedDay = false;
                          calendarView = CalendarView.week;
                          _controller.view = calendarView;
                        });
                      },
                      child: isPressedWeek
                          ? const Text(
                              "Week View",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          : const Text(
                              "Week View",
                              style: TextStyle(
                                color: Color(0xFF0B6BA7),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: isPressedDay
                              ? const Color(0xFF0B6BA7)
                              : Colors.transparent),
                      onPressed: () {
                        setState(() {
                          isPressedMonth = false;
                          isPressedWeek = false;
                          isPressedDay = true;
                          calendarView = CalendarView.day;
                          _controller.view = calendarView;
                        });
                      },
                      child: isPressedDay
                          ? const Text(
                              "Day View",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          : const Text(
                              "Day View",
                              style: TextStyle(
                                color: Color(0xFF0B6BA7),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SfCalendar(
                  headerStyle: const CalendarHeaderStyle(
                      textAlign: TextAlign.center,
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          color: Color(0xff1c1c1c),
                          fontWeight: FontWeight.w700)),
                  todayTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                  appointmentTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                  blackoutDatesTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                  view: calendarView,
                  firstDayOfWeek: 7,
                  dataSource: events,
                  controller: _controller,
                  timeSlotViewSettings: const TimeSlotViewSettings(
                      timeTextStyle: TextStyle(fontFamily: 'Poppins')),
                  monthViewSettings: const MonthViewSettings(
                      appointmentDisplayMode:
                          MonthAppointmentDisplayMode.indicator,
                      showAgenda: true,
                      agendaStyle: AgendaStyle(
                        appointmentTextStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                        dateTextStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.italic,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff1c1c1c)),
                        dayTextStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff1c1c1c)),
                      ),
                      monthCellStyle: MonthCellStyle(
                        textStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: Color(0xff1c1c1c)),
                        trailingDatesTextStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: Color(0xffcecece)),
                        leadingDatesTextStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: Color(0xffcecece)),
                      )),
                  initialSelectedDate: DateTime.now(),
                  onLongPress: (details) {
                    final meeting = details.appointments!.first;
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            EventViewingPage(calendarModel: meeting)));
                  },
                  todayHighlightColor: const Color(0xFF0B6BA7),
                  selectionDecoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.green, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    shape: BoxShape.rectangle,
                  ),
                  cellBorderColor: Colors.transparent,
                  showNavigationArrow: false,
                ),
              )
            ],
          ),
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
