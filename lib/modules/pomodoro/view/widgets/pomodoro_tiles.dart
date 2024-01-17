// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_first_ggs_later/modules/pomodoro/controller/pomodoro_controller.dart';
import 'package:study_first_ggs_later/modules/pomodoro/models/pomodoro_model.dart';
import 'package:study_first_ggs_later/modules/pomodoro/view/screens/pomodoro.dart';
import 'package:study_first_ggs_later/modules/pomodoro/view/screens/pomodoro_edit.dart';

class PomodoroTileWidget extends StatelessWidget {
  final PomodoroModel pomodoroModel;
  final Color colorNotes;

  const PomodoroTileWidget({
    Key? key,
    required this.pomodoroModel,
    required this.colorNotes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setInt('minRunning', pomodoroModel.minutesRunning);
        await prefs.setInt('secRunning', pomodoroModel.secondsRunning);
        await prefs.setInt('minShort', pomodoroModel.minutesShort);
        await prefs.setInt('secShort', pomodoroModel.secondsShort);
        await prefs.setInt('minLong', pomodoroModel.minutesLong);
        await prefs.setInt('secLong', pomodoroModel.secondsLong);
        Get.back(result: true);
        // PomodoroController().getSetTimer();
      },
      onLongPress: () async {
        Get.to(pomodoroEditPage(
            pomodoroId: pomodoroModel.id, pomodoroModel: pomodoroModel));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
              color: colorNotes,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              )),
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pomodoroModel.title,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        color: Color(0xff1c1c1c)),
                  ),
                  Text(
                    '${pomodoroModel.minutesRunning} Minutes : ${pomodoroModel.secondsRunning} Seconds',
                    style: const TextStyle(
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        color: Color(0xff1c1c1c)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
