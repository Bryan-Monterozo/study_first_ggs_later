import 'package:flutter/material.dart';
import 'meeting.dart';

class MeetingProvider extends ChangeNotifier {
  final List<Meeting> meetings = [];

  List<Meeting> get meeting => meetings;

  void addMeeting(Meeting meeting){
    meetings.add(meeting);
    notifyListeners();
  }

  void editMeeting(int index){
    notifyListeners();
  }
}
