import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/calendar/controller/calendar_get_controller.dart';
import 'package:study_first_ggs_later/modules/calendar/models/calendar_model.dart';
import 'package:study_first_ggs_later/modules/calendar/services/calendar_collection.dart';
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
              onPressed: () async => await Navigator.of(context)
                  .push(MaterialPageRoute(
                      builder: (context) => EventEditingPage(
                          calendarModel: widget.calendarModel)))
                  .then((_) => setState(() {})),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  CalendarDB()
                      .deleteEventToDB(eventID: widget.calendarModel.eventID);
                  Navigator.of(context).pop();
                },
              ),
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
                        color: Color(0xff1c1c1c),
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 10),
                  Text(widget.calendarModel.eventDescription,
                      style: const TextStyle(
                          color: Color(0xff1c1c1c),
                          fontFamily: 'Poppins',
                          fontSize: 18)),
                  const SizedBox(height: 20),
                  buildDateTime(widget.calendarModel),
                  const SizedBox(height: 20),
                  if (widget.calendarModel.isAllDay)
                    const Text(
                      "Meeting is All Day",
                      style: TextStyle(
                          color: Color(0xff1c1c1c),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold),
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
        const SizedBox(
          height: 10,
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
              flex: 5,
              child: Text(
                Utils.toDate(DateTime.parse(widget.calendarModel.from)),
                style: const TextStyle(fontFamily: 'Poppins'),
              )),
          Expanded(
              child: Text(
            Utils.toTime(DateTime.parse(widget.calendarModel.from)),
            style: const TextStyle(fontFamily: 'Poppins'),
          )),
        ],
      ));

  Widget buildDateTo(String title, DateTime date) => buildHeader(
      header: 'TO',
      child: Row(children: [
        Expanded(
            flex: 5,
            child: Text(
              Utils.toDate(DateTime.parse(widget.calendarModel.to)),
              style: const TextStyle(fontFamily: 'Poppins'),
            )),
        Expanded(
            child: Text(
          Utils.toTime(DateTime.parse(widget.calendarModel.to)),
          style: const TextStyle(fontFamily: 'Poppins'),
        )),
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
            style: const TextStyle(
              color: Color(0xff1c1c1c),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
          child,
        ],
      );
}
