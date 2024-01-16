import 'dart:ui';

import 'package:flutter/material.dart';

class CalendarModel {
  final String eventName;
  final String eventDescription;
  final String from;
  final String to;
  final Color background;
  final bool isAllDay;
  final String eventID;

  CalendarModel(
      {required this.eventName,
      required this.eventDescription,
      required this.from,
      required this.to,
      required this.isAllDay,
      required this.eventID,
      this.background = const Color(0xFF0B6BA7)});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'eventName': eventName,
      'eventDescription': eventDescription,
      'from': from,
      'to': to,
      'background': background,
      'isAllDay': isAllDay,
      'eventID': eventID,
    };
  }

  factory CalendarModel.fromMap(Map<String, dynamic> map) {
    return CalendarModel(
      eventName: map['eventName'] as String,
      eventDescription: map['eventDescription'] as String,
      from: map['from'] as String,
      to: map['to'] as String,
      background: const Color(0xFF0B6BA7),
      isAllDay: map['isAllDay'] as bool,
      eventID: map['eventID'] as String,
    );
  }
}
