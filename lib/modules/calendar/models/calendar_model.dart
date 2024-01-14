
import 'package:flutter/material.dart';

class CalendarModel {

  final String eventName;
  final String eventDescription;
  final String from;
  final String to;
  Color background;
  final bool isAllDay;

  CalendarModel({required this.eventName, required this.eventDescription, required this.from, required this.to, required this.isAllDay, this.background = Colors.red});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'eventName': eventName,
      'eventDescription': eventDescription,
      'from': from,
      'to': to,
      // 'background': background,
      'isAllDay': isAllDay,
    };
  }

  // DateTime.fromMillisecondsSinceEpoch(map['from'] as int),

  factory CalendarModel.fromMap(Map<String, dynamic> map) {
    return CalendarModel(
      eventName: map['eventName'] as String,
      eventDescription: map['eventDescription'] as String,
      from: 
      map['from'] as String,
      // DateTime(map['from'] as int),
      to: 
      map['to'] as String,
      // DateTime(map['to'] as int),
      // background: Colors.red,
      isAllDay: map['isAllDay'] as bool,
    );
  }
}

