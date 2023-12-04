import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_first_ggs_later/modules/calendar/view/screens/meeting_provider.dart';
import 'package:study_first_ggs_later/utils.dart';
import 'event_editing_page.dart';
import 'meeting.dart';

class EventViewingPage extends StatelessWidget {
  final Meeting meeting;

  const EventViewingPage({
    Key? key,
    required this.meeting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EventEditingPage(meeting: meeting))),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              final provider =
                  Provider.of<MeetingProvider>(context, listen: false);
              provider.deleteMeeting(meeting);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: ListView(padding: const EdgeInsets.all(32), children: <Widget>[
        Text(
          meeting.eventName,
          style: (const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 16),
        Text(meeting.eventDescription,
            style: const TextStyle(color: Colors.black, fontSize: 18)),
        const SizedBox(height: 16),
        buildDateTime(meeting),
        const SizedBox(height: 16),
        if (meeting.isAllDay)
          const Text(
            "Meeting is All Day",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
      ]));

  Widget buildDateTime(Meeting meeting) {
    return Column(
      children: [
        buildDateFrom(
          meeting.isAllDay ? 'All-Day' : 'From',
          meeting.from,
        ),
        if (!meeting.isAllDay) buildDateTo('TO', meeting.to),
      ],
    );
  }

  Widget buildDateFrom(String title, DateTime date) => buildHeader(
      header: 'FROM',
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(Utils.toDate(meeting.from))),
          Expanded(child: Text(Utils.toTime(meeting.from))),
        ],
      ));

  Widget buildDateTo(String title, DateTime date) => buildHeader(
      header: 'TO',
      child: Row(children: [
        Expanded(flex: 2, child: Text(Utils.toDate(meeting.to))),
        Expanded(child: Text(Utils.toTime(meeting.to))),
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
