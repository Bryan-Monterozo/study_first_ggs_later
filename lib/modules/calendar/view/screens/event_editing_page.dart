import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/calendar/controller/calendar_get_controller.dart';
import 'package:study_first_ggs_later/modules/calendar/models/calendar_model.dart';
import 'package:study_first_ggs_later/modules/calendar/services/calendar_collection.dart';
import 'package:study_first_ggs_later/utils.dart';

class EventEditingPage extends StatefulWidget {
  final CalendarModel? calendarModel;

  const EventEditingPage({
    Key? key,
    this.calendarModel,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EventEditingPageState createState() => _EventEditingPageState();
}

class _EventEditingPageState extends State<EventEditingPage> {
  final CalendarGetController calendarController =
      Get.put(CalendarGetController());
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  late DateTime fromDate;
  late DateTime toDate;
  late bool allDay = false;

  @override
  void initState() {
    super.initState();
    final meeting = widget.calendarModel!;

    titleController.text = meeting.eventName;
    descriptionController.text = meeting.eventDescription;
    fromDate = DateTime.parse(meeting.from);
    toDate = DateTime.parse(meeting.to);
    allDay = meeting.isAllDay;
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CloseButton(),
          actions: buildEditingActions(),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  buildTitle(),
                  const SizedBox(height: 12),
                  buildDateTimePickers(),
                  const SizedBox(height: 12),
                  buildAllDay(),
                  const SizedBox(height: 12),
                  buildDescription(),
                ],
              ),
            )));
  }

  List<Widget> buildEditingActions() => [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0B6BA7),
              shadowColor: Colors.transparent,
            ),
            onPressed: () {
              saveForm();
            },
            icon: const Icon(Icons.done, color: Colors.white),
            label: const Text("Save",
                style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
          ),
        )
      ];

  Widget buildTitle() => TextFormField(
        style: const TextStyle(fontFamily: 'Poppins',
          fontSize: 24, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterStyle: TextStyle(
            height: double.minPositive,
          ),
          counterText: "",
          hintText: 'Add Title',
        ),
        maxLength: 30,
        validator: (title) =>
            title != null && title.isEmpty ? 'Title cannot be empty' : null,
        controller: titleController,
      );

  Widget buildDateTimePickers() => Column(
        children: [
          buildFrom(),
          const SizedBox(
            height: 10,
          ),
          buildTo(),
        ],
      );

  Widget buildAllDay() => Row(children: [
        const Text(
          'Is the Meeting All Day?',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        Checkbox(
            value: allDay,
            activeColor: const Color(0xFF0B6BA7),
            onChanged: (bool? value) {
              setState(() {
                allDay = value!;
              });
            })
      ]);

  Widget buildDescription() => TextFormField(
        style: const TextStyle(fontFamily: 'Poppins', fontSize: 16),
        decoration: InputDecoration(
          hintText: 'Add Description',
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Color(0xffcecece)),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Color(0xffcecece)),
              borderRadius: BorderRadius.circular(12)),
        ),
        controller: descriptionController,
        maxLines: null,
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
              flex: 2,
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
              flex: 2,
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
      toDate =
          DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
    }

    setState(() => fromDate = date);
  }

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(
      toDate,
      pickDate: pickDate,
      firstDate: pickDate ? fromDate : null,
    );
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
    } else {
      final timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );

      if (timeOfDay == null) return null;

      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);

      return date.add(time);
    }
  }

  Widget buildDropDownField({
    required String text,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        title: Text(
          text,
          style: const TextStyle(fontFamily: 'Poppins'),
        ),
        trailing: const Icon(Icons.arrow_drop_down_rounded),
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
            style: const TextStyle(
                fontFamily: 'Poppins', fontWeight: FontWeight.bold),
          ),
          child,
        ],
      );

  Future saveForm() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final CalendarDB calendarDB = CalendarDB();
      calendarDB.editEventToDB(
          eventName: titleController.text,
          eventDescription: descriptionController.text,
          from: fromDate.toString(),
          to: toDate.toString(),
          isAllDay: allDay,
          eventID: widget.calendarModel!.eventID);

      Navigator.of(context).pop();
      calendarController.saveController();
    }
  }
}
