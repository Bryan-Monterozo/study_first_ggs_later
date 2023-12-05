import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/calendar/controller/calendar_get_controller.dart';
import 'package:study_first_ggs_later/modules/calendar/models/calendar_model.dart';
import 'package:study_first_ggs_later/modules/calendar/services/calendar_collection.dart';
import 'package:study_first_ggs_later/utils.dart';
import 'event_editing_page.dart';

class EventViewingPage extends StatelessWidget {
  final CalendarModel calendarModel;

  const EventViewingPage({
    Key? key,
    required this.calendarModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    CalendarGetController calendarController = Get.put(CalendarGetController());
    return Scaffold(
        appBar: AppBar(
          leading: const CloseButton(),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      EventEditingPage(calendarModel: calendarModel))),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                CalendarDB().deleteEventToDB(eventID: calendarModel.eventID);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: GetBuilder<CalendarGetController>(
            init: CalendarGetController(),
            id: 'eventView',
            builder: (controller) =>
                ListView(padding: const EdgeInsets.all(32), children: <Widget>[
                  Text(
                    calendarModel.eventName,
                    style: (const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 16),
                  Text(calendarModel.eventDescription,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 18)),
                  const SizedBox(height: 16),
                  buildDateTime(calendarModel),
                  const SizedBox(height: 16),
                  if (calendarModel.isAllDay)
                    const Text(
                      "Meeting is All Day",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                ])));
  }

  Widget buildDateTime(CalendarModel calendarModel) {
    return Column(
      children: [
        buildDateFrom(
          calendarModel.isAllDay ? 'All-Day' : 'From',
          DateTime.parse(calendarModel.from),
        ),
        if (!calendarModel.isAllDay)
          buildDateTo('TO', DateTime.parse(calendarModel.to)),
      ],
    );
  }

  Widget buildDateFrom(String title, DateTime date) => buildHeader(
      header: 'FROM',
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Text(Utils.toDate(DateTime.parse(calendarModel.from)))),
          Expanded(
              child: Text(Utils.toTime(DateTime.parse(calendarModel.from)))),
        ],
      ));

  Widget buildDateTo(String title, DateTime date) => buildHeader(
      header: 'TO',
      child: Row(children: [
        Expanded(
            flex: 2,
            child: Text(Utils.toDate(DateTime.parse(calendarModel.to)))),
        Expanded(child: Text(Utils.toTime(DateTime.parse(calendarModel.to)))),
      ]));

  Widget buildHeader({
    required String header,
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          child,
        ],
      );
}
