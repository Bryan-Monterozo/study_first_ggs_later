// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:study_first_ggs_later/modules/pomodoro/services/pomodoro_collection.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class pomodoroAddPage extends StatefulWidget {
  const pomodoroAddPage({super.key});
  static const String routeName = '/pomodoro/pomodoro_add';

  @override
  // ignore: no_logic_in_create_state
  State<pomodoroAddPage> createState() => _pomodoroAddPageState();
}

class _pomodoroAddPageState extends State<pomodoroAddPage> {
  String title = '';
  int minutesLong = 0;
  int minutesShort = 0;
  int minutesRunning = 0;
  int secondsShort = 0;
  int secondsLong = 0;
  int secondsRunning = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        leading: leadingBack(context),
        title: "",
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 12),
            color: const Color(0xff1c1c1c),
            icon: const Icon(Icons.save_rounded),
            onPressed: () {
              PomodoroDB().addPomodoroToDB(
                title: title,
                minutesRunning: minutesRunning,
                minutesShort: minutesShort,
                minutesLong: minutesLong,
                secondsRunning: secondsRunning,
                secondsShort: secondsShort,
                secondsLong: secondsLong,
              );
              Get.back();
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              style: const TextStyle(
                fontSize: 30,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
              maxLength: 60,
              onChanged: (value) {
                title = value;
              },
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  counterStyle: TextStyle(
                    height: double.minPositive,
                  ),
                  counterText: "",
                  hintStyle: TextStyle(
                    color: Color(0xffcecece),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                  hintText: 'Title'),
            ),
            const Expanded(
                flex: 1,
                child: Text('Running Time',
                    style: TextStyle(fontSize: 20, fontFamily: 'Poppins'))),
            Expanded(
                flex: 3,
                child: GestureDetector(
                  onTap: () {
                    openPickerForRunning();
                  },
                  child: Text(
                    '$minutesRunning Minutes : $secondsRunning Seconds',
                    style: const TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                  ),
                )),
            const Expanded(
                flex: 1,
                child: Text('Short Break',
                    style: TextStyle(fontSize: 20, fontFamily: 'Poppins'))),
            Expanded(
                flex: 3,
                child: GestureDetector(
                  onTap: () {
                    openPickerForShort();
                  },
                  child: Text(
                    '$minutesShort Minutes : $secondsShort Seconds',
                    style: const TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                  ),
                )),
            const Expanded(
                flex: 1,
                child: Text('Long Break',
                    style: TextStyle(fontSize: 20, fontFamily: 'Poppins'))),
            Expanded(
                flex: 3,
                child: GestureDetector(
                  onTap: () {
                    openPickerForLong();
                  },
                  child: Text(
                    '$minutesLong Minutes : $secondsLong Seconds',
                    style: const TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void openPickerForShort() {
    Picker(
      adapter: NumberPickerAdapter(data: <NumberPickerColumn>[
        const NumberPickerColumn(
            begin: 0, end: 60, suffix: Text(' minutes'), jump: 1),
        const NumberPickerColumn(
            begin: 0, end: 60, suffix: Text(' seconds'), jump: 5),
      ]),
      delimiter: <PickerDelimiter>[
        PickerDelimiter(
          child: Container(
            width: 30.0,
            alignment: Alignment.center,
            child: Icon(Icons.more_vert),
          ),
        )
      ],
      hideHeader: true,
      confirmText: 'OK',
      confirmTextStyle:
          const TextStyle(inherit: false, color: Colors.red, fontSize: 22),
      title: const Text('Select duration'),
      selectedTextStyle: const TextStyle(color: Colors.blue),
      onConfirm: (Picker picker, List<int> value) {
        // You get your duration here
        minutesShort = picker.getSelectedValues()[0];
        secondsShort = picker.getSelectedValues()[1];
        setState(() {});
      },
    ).showDialog(context);
  }

  void openPickerForLong() {
    Picker(
      adapter: NumberPickerAdapter(data: <NumberPickerColumn>[
        const NumberPickerColumn(
            begin: 0, end: 60, suffix: Text(' minutes'), jump: 1),
        const NumberPickerColumn(
            begin: 0, end: 60, suffix: Text(' seconds'), jump: 5),
      ]),
      delimiter: <PickerDelimiter>[
        PickerDelimiter(
          child: Container(
            width: 30.0,
            alignment: Alignment.center,
            child: Icon(Icons.more_vert),
          ),
        )
      ],
      hideHeader: true,
      confirmText: 'OK',
      confirmTextStyle:
          const TextStyle(inherit: false, color: Colors.red, fontSize: 22),
      title: const Text('Select duration'),
      selectedTextStyle: const TextStyle(color: Colors.blue),
      onConfirm: (Picker picker, List<int> value) {
        // You get your duration here
        minutesLong = picker.getSelectedValues()[0];
        secondsLong = picker.getSelectedValues()[1];
        setState(() {});
      },
    ).showDialog(context);
  }

  void openPickerForRunning() {
    Picker(
      adapter: NumberPickerAdapter(data: <NumberPickerColumn>[
        const NumberPickerColumn(
            begin: 0, end: 60, suffix: Text(' minutes'), jump: 1),
        const NumberPickerColumn(
            begin: 0, end: 60, suffix: Text(' seconds'), jump: 5),
      ]),
      delimiter: <PickerDelimiter>[
        PickerDelimiter(
          child: Container(
            width: 30.0,
            alignment: Alignment.center,
            child: Icon(Icons.more_vert),
          ),
        )
      ],
      hideHeader: true,
      confirmText: 'OK',
      confirmTextStyle:
          const TextStyle(inherit: false, color: Colors.red, fontSize: 22),
      title: const Text('Select duration'),
      selectedTextStyle: const TextStyle(color: Colors.blue),
      onConfirm: (Picker picker, List<int> value) {
        // You get your duration here
        minutesRunning = picker.getSelectedValues()[0];
        secondsRunning = picker.getSelectedValues()[1];
        setState(() {});
      },
    ).showDialog(context);
  }
}
