import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/calendar/controller/calendar_get_controller.dart';
import 'package:study_first_ggs_later/modules/calendar/models/calendar_model.dart';
import 'package:study_first_ggs_later/modules/calendar/services/calendar_collection.dart';
import 'package:study_first_ggs_later/modules/calendar/view/screens/meeting_data_source.dart';
import 'package:study_first_ggs_later/utils.dart';
import 'event_editing_page.dart';

class EventViewingPage extends StatefulWidget {
  final CalendarModel calendarModel;

  const EventViewingPage({
    Key? key,
    required this.calendarModel,
  }) : super(key: key);

  @override
  State<EventViewingPage> createState() => _EventViewingPageState();
}

class _EventViewingPageState extends State<EventViewingPage> {
  MeetingDataSource? events;
  @override
  Widget build(BuildContext context) {
    // CalendarGetController calendarController = Get.put(CalendarGetController());
    return Scaffold(
        appBar: AppBar(
          leading: const CloseButton(),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () async => await Navigator.of(context)
                  .push(MaterialPageRoute(
                      maintainState: false,
                      builder: (context) => EventEditingPage(
                          calendarModel: widget.calendarModel)))
                  .then((_) => setState(() {})),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                CalendarDB()
                    .deleteEventToDB(eventID: widget.calendarModel.eventID);
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
                    widget.calendarModel.eventName,
                    style: (const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 16),
                  Text(widget.calendarModel.eventDescription,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 18)),
                  const SizedBox(height: 16),
                  buildDateTime(widget.calendarModel),
                  const SizedBox(height: 16),
                  if (widget.calendarModel.isAllDay)
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
        const SizedBox(height: 20),
        if (!calendarModel.isAllDay)
          buildDateTo('TO', DateTime.parse(calendarModel.to)),
      ],
    );
  }

  Widget buildDateFrom(String title, DateTime date) => buildHeader(
      header: 'FROM: ',
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Text(
                  Utils.toDate(DateTime.parse(widget.calendarModel.from)))),
          Expanded(
              child: Text(
                  Utils.toTime(DateTime.parse(widget.calendarModel.from)))),
        ],
      ));

  Widget buildDateTo(String title, DateTime date) => buildHeader(
      header: 'TO: ',
      
      child: Row(children: [
        Expanded(
            flex: 2,
            child: Text(Utils.toDate(DateTime.parse(widget.calendarModel.to)))),
        Expanded(
            child: Text(Utils.toTime(DateTime.parse(widget.calendarModel.to)))),
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
