import 'package:flutter/material.dart';

class Meeting {
  final String eventName;
  final String eventDescription;
  final DateTime from;
  final DateTime to;
  final Color background;
  final bool isAllDay;

  Meeting({
    required this.eventName,
    required this.eventDescription,
    required this.from,
    required this.to,
    this.background = Colors.red,
    this.isAllDay = false,
  });
}
