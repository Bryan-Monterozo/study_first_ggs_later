import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_first_ggs_later/modules/calendar/view/screens/calendar_provider.dart';
import 'package:study_first_ggs_later/utils.dart';
import 'meeting.dart';

class EventEditingPage extends StatefulWidget {
  final Meeting? meeting;

  const EventEditingPage({
    Key? key,
    this.meeting,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EventEditingPageState createState() => _EventEditingPageState();  
}


class _EventEditingPageState extends State<EventEditingPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  late DateTime fromDate;
  late DateTime toDate;

  @override
  void initState() {
    super.initState();

    if (widget.meeting == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(const Duration(hours: 2));
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        actions: buildEditingActions(),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                buildTitle(),
                const SizedBox(height: 12),
                buildDateTimePickers(),
              ],
            ),
          )));

  List<Widget> buildEditingActions() => [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: saveForm,
          icon: const Icon(Icons.done),
          label: const Text("Save"),
        )
      ];

  Widget buildTitle() => TextFormField(
        style: const TextStyle(fontSize: 24),
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          hintText: 'Add Title',
        ),
        onFieldSubmitted: (_) => saveForm(),
        validator: (title) =>
            title != null && title.isEmpty ? 'Title cannot be empty' : null,
        controller: titleController,
      );

  Widget buildDateTimePickers() => Column(
        children: [
          buildFrom(),
          buildTo(),
        ],
      );

  Widget buildFrom() => buildHeader(
      header: 'FROM',
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: buildDropDownField(
                text: Utils.toDate(fromDate),
                onClicked: () => pickFromDateTime(pickDate: true),
              )),
          Expanded(
              child: buildDropDownField(
            text: Utils.toTime(fromDate),
            onClicked: () => pickFromDateTime(pickDate: false),
          )),
        ],
      ));

  Widget buildTo() => buildHeader(
      header: 'TO',
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: buildDropDownField(
                text: Utils.toDate(toDate),
                onClicked: () => pickToDateTime(pickDate: true),
              )),
          Expanded(
              child: buildDropDownField(
            text: Utils.toTime(toDate),
            onClicked: () => pickToDateTime(pickDate: false),
          )),
        ],
      ));

  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(fromDate, pickDate: pickDate);
    if (date == null) return;

    if (date.isAfter(toDate)) {
      toDate = DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
    }

    setState(() => fromDate = date);
  }

    Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(toDate, pickDate: pickDate, firstDate: pickDate ? fromDate: null,);
    if (date == null) return;

    setState(() => toDate = date);
  }

  Future<DateTime?> pickDateTime(
    DateTime initialDate, {
    required bool pickDate,
    DateTime? firstDate,
  }) async {
    if (pickDate) {
      final date = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate ?? DateTime.now(),
        lastDate: DateTime(2100),
      );

      if (date == null) return null;

      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);

      return date.add(time);
    } 
    else {
      final timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );

      if (timeOfDay == null) return null;

      final date = DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);

      return date.add(time);
    }
  }

  Widget buildDropDownField({
    required String text,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        title: Text(text),
        trailing: const Icon(Icons.arrow_drop_down),
        onTap: onClicked,
      );

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

  Future saveForm() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final meeting = Meeting(
        eventName: titleController.text,
        eventDescription: 'Description',
        from: fromDate,
        to: toDate,
        isAllDay: false,
      );

      final provider = Provider.of<MeetingProvider>(context, listen: false);
      provider.addMeeting(meeting);

      Navigator.of(context).pop();
    }
  }
}
