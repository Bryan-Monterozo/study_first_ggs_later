import 'dart:ui';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'meeting.dart';

class MeetingDataSource extends CalendarDataSource{
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  Meeting getEvent(int index) => appointments![index] as Meeting;

  @override
  String getSubject(int index) => getEvent(index).eventName;
  
  String getDescription(int index) => getEvent(index).eventDescription;

  @override
  DateTime getStartTime(int index) => getEvent(index).from;

  @override
  DateTime getEndTime(int index) => getEvent(index).to;

  @override
  Color getColor(int index) => getEvent(index).background;

  @override
  bool isAllDay(int index) => getEvent(index).isAllDay;
}