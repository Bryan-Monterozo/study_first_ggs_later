import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/calendar/view/screens/meeting_provider.dart';
import 'package:study_first_ggs_later/modules/calendar/view/screens/meeting_data_source.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:provider/provider.dart';
import 'event_viewing_page.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TasksWidgetState createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MeetingProvider>(context);
    final selectedEvents = provider.meetingsOfSelectedDate;

    if (selectedEvents.isEmpty) {
      return const Center(
        child: Text(
          'No Events Found!',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      );
    }

    return SfCalendarTheme(
        data: SfCalendarThemeData(
            timeTextStyle: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        )),
        child: SfCalendar(
          view: CalendarView.timelineDay,
          dataSource: MeetingDataSource(provider.meeting),
          initialDisplayDate: provider.selectedDate,
          appointmentBuilder: appointmentBuilder,
          todayHighlightColor: Colors.blue,
          selectionDecoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.3),
          ),
          headerHeight: 0,
          onTap: (details) {
            if (details.appointments == null) return;
            final meeting = details.appointments!.first;

            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EventViewingPage(meeting: meeting)));
          },
        ));
  }

  Widget appointmentBuilder(
    BuildContext context,
    CalendarAppointmentDetails details,
  ) {
    final meeting = details.appointments.first;

    return Container(
        width: details.bounds.width,
        height: details.bounds.height,
        decoration: BoxDecoration(
            color: meeting.background.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(
            meeting.eventName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
