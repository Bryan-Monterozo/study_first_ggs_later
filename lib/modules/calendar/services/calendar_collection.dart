import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_first_ggs_later/modules/calendar/models/calendar_model.dart';

class CalendarDB {
  final firestore = FirebaseFirestore.instance;

  void addEventToDB({
    required eventName,
    required eventDescription,
    required from,
    required to,
    required isAllDay,
  }) async {
    final collection = firestore.collection('Calendar').doc();

    CalendarModel calendarModel = CalendarModel(
      eventName: eventName,
      eventDescription: eventDescription,
      from: from,
      to: to,
      isAllDay: isAllDay,
      eventID: collection.id,
    );

    await collection.set(calendarModel.toMap());
  }

  void editEventToDB({
    required eventName,
    required eventDescription,
    required from,
    required to,
    required isAllDay,
    required eventID,
  }) async {

    await firestore.collection('Calendar').doc(eventID).update({
      'eventName': eventName,
      'eventDescription': eventDescription,
      'from': from,
      'to': to,
      'isAllDay': isAllDay,
    });
  }

  void deleteEventToDB({required eventID}) async {
    await firestore.collection('Calendar').doc(eventID).delete();
  }
}
