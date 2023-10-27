import 'package:flutter/material.dart';
import 'meeting.dart';

class MeetingProvider extends ChangeNotifier {
  final List<Meeting> meetings = [];

  List<Meeting> get meeting => meetings;

  void addMeeting(Meeting meeting){
    meetings.add(meeting);
    notifyListeners();
  }

  void editMeeting(Meeting newMeeting, Meeting oldMeeting){

    final index = meetings.indexOf(oldMeeting);
    meetings[index] = newMeeting;
    notifyListeners();
  }

  void deleteMeeting(Meeting oldMeeting) {
    final index = meetings.indexOf(oldMeeting);
    meetings.removeAt(index);
    notifyListeners();
  }

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void setDate(DateTime date) => _selectedDate = date;

  List<Meeting> get meetingsOfSelectedDate => meetings;

}
