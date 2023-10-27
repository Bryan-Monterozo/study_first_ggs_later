import 'package:flutter/material.dart';

class Meeting {
  Meeting({required this.eventName, required this.eventDescription, required this.from, required this.to, this.background = Colors.red, this.isAllDay = false,});

  final String eventName;
  final String eventDescription;
  final DateTime from;
  final DateTime to;
  final Color background;
  final bool isAllDay;

  void add(Meeting meetings) {}
}