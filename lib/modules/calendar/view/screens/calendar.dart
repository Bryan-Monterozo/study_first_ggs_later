import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'event.dart';

class StudyCalendar extends StatefulWidget {
  const StudyCalendar({super.key});

  @override
  State<StudyCalendar> createState() => _StudyCalendarState();
}

class _StudyCalendarState extends State<StudyCalendar> {
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _selectedDay;
  Map<DateTime, List<Event>> events = {}; //store Events
  final TextEditingController _eventController = TextEditingController();
  late final ValueNotifier<List<Event>> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _selectedEvents.value = _getEventsForDay(selectedDay);
      });
    }
  }

  List<Event> _getEventsForDay(DateTime day) {
    //retrieve all events from the selected day
    return events[day] ?? [];
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
        onPressed: () {
          //show a dialog for user to input event name
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  scrollable: true,
                  title: Text("Event Name"),
                  content: Padding(
                    padding: EdgeInsets.all(8),
                    child: TextField(
                      controller: _eventController,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        //store event name to the map
                        events.addAll({
                          _selectedDay!: [Event(_eventController.text)]
                        });
                        Navigator.of(context).pop();
                        _selectedEvents.value = _getEventsForDay(_selectedDay!);
                      },
                      child: Text("Submit"),
                    )
                  ],
                );
              });
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Calendar',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            TableCalendar(
              headerStyle: const HeaderStyle(titleCentered: true),
              startingDayOfWeek: StartingDayOfWeek.monday,
              availableGestures: AvailableGestures.all,
              calendarStyle: const CalendarStyle(
                outsideDaysVisible: false,
              ),
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              calendarFormat: _calendarFormat,
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              eventLoader: _getEventsForDay,
              onDaySelected: _onDaySelected,
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            Expanded(
              child: ValueListenableBuilder<List<Event>>(
                  valueListenable: _selectedEvents,
                  builder: (context, value, _) {
                    return ListView.builder(
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                // ignore: avoid_print
                                onTap: () => print(""),
                                title: Text('${value[index]}'),
                              ));
                        });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
