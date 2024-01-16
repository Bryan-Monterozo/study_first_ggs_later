import 'dart:ui';

import 'package:study_first_ggs_later/modules/calendar/models/calendar_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<CalendarModel> source) {
    appointments = source;
  }

  CalendarModel getEvent(int index) => appointments![index] as CalendarModel;

  // @override
  // String getSubject(int index) => getEvent(index).eventName;

  // String getDescription(int index) => getEvent(index).eventDescription;

  @override
  DateTime getStartTime(int index) => DateTime.parse(getEvent(index).from);

  @override
  DateTime getEndTime(int index) => DateTime.parse(getEvent(index).to);

  @override
  Color getColor(int index) => const Color(0xFF0B6BA7);

  // @override
  // bool isAllDay(int index) => getEvent(index).isAllDay;
}
