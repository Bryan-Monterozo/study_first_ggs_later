library pomodoro_lib;

import 'dart:async';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:study_first_ggs_later/core/constants/route.dart';
import 'package:study_first_ggs_later/modules/pomodoro/view/widgets/progress_icons.dart';
import 'package:study_first_ggs_later/modules/pomodoro/view/widgets/pomodoro_button.dart';
import 'package:study_first_ggs_later/modules/pomodoro/models/pomodoro_status.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/shared/controller/nav_controller.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';
part 'package:study_first_ggs_later/core/constants/pomodoro_constants.dart';

/*
TODO: Organize code blocks to their respective folders
      Subject for changes:
        --Design
        --Functionality
      For Testing:
        --Automatic state changing
        --buttons
        --timer
        --pomodoro count
        --set count
        --progress bar
        --progress icons
        --status text
        --status color
      Mag lagay comment if may tanong o eme kayo dito or sa code blocks
*/

class Pomodoro extends StatefulWidget {
  static const String routeName = '/pomodoro';
  const Pomodoro({Key? key}) : super(key: key);

  @override
  State<Pomodoro> createState() => _PomodoroState();
}

// TODO: put to constants folder

class _PomodoroState extends State<Pomodoro> {
  int remainingTime = pomodoroTotalTime;
  String pomodoroBtnText = _btnTextStart;
  PomodoroStatus pomodoroStatus = PomodoroStatus.pausedPomodoro;
  Timer? _timer;
  int pomodoroNum = 0;
  int setNum = 0;
  bool toggle = false;

  NavController navController = Get.put(NavController());

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

  @override
  void initState() {
    navController.initNav(
      currentRoute: CurrentRoute.pomodoro,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SharedAppBar(
        title: "Pomodoro",
        withPic: withPic(context),
      ),
      drawer: const NavDrawer(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 40,
                width: 300,
                decoration: const BoxDecoration(
                    color: Color(0xFF0B6BA7),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    )),
                child: Align(
                  alignment: const AlignmentDirectional(0.00, 0.00),
                  child: Text('$pomodoroStatus',
                      style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          color: Colors.white)),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            CircularPercentIndicator(
              arcType: ArcType.FULL,
              arcBackgroundColor: const Color(0xffcecece),
              radius: 220.0,
              circularStrokeCap: CircularStrokeCap.round,
              lineWidth: 15.0,
              percent: _getPomodoroPercentage(),
              center: Text(
                _secToString(remainingTime),
                style: const TextStyle(
                    fontSize: 60,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0B6BA7)),
              ),
              progressColor: statusColor[pomodoroStatus],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$pomodoroNum',
                    style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0B6BA7))),
                ProgressIcons(
                  total: pomodoroPerSet,
                  done: pomodoroNum - (setNum * pomodoroPerSet),
                ),
                Text('$setNum',
                    style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0B6BA7))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PomodoroButton(
                  onTap: _resetPomodoroCount,
                  buttonIcon: const Icon(Icons.restart_alt_rounded, size: 30),
                ),
                PomodoroButton(
                    onTap: _mainBtnPressed,
                    buttonIcon: toggle == false
                        ? const Icon(
                            Icons.play_arrow_rounded,
                            size: 80,
                          )
                        : const Icon(
                            Icons.pause_rounded,
                            size: 80,
                          )),
                PomodoroButton(
                  onTap: _resetPomodoroCount,
                  buttonIcon: const Icon(
                    Icons.stop_rounded,
                    size: 40,
                  ),
                ),
              ],
            ),
            PomodoroButton(
              onTap: _resetPomodoroCount,
              buttonIcon: const Icon(
                Icons.keyboard_control_rounded,
                size: 40,
                color: Color(0xffcecece),
              ),
            ),
          ],
        ),
      ),
    );
  }

// TODO: Refactor this to core/utils named (sec_to_string.dart)

  _secToString(int seconds) {
    int roundedMinutes = seconds ~/ 60;
    int remainingSeconds = seconds - (roundedMinutes * 60);
    String remainingSecondsStr;

    if (remainingSeconds < 10) {
      remainingSecondsStr = '0$remainingSeconds';
    } else {
      remainingSecondsStr = remainingSeconds.toString();
    }

    return '$roundedMinutes:$remainingSecondsStr';
  }

  _getPomodoroPercentage() {
    int totalTime;
    switch (pomodoroStatus) {
      case PomodoroStatus.runningPomodoro:
        totalTime = pomodoroTotalTime;
        break;
      case PomodoroStatus.pausedPomodoro:
        totalTime = pomodoroTotalTime;
        break;
      case PomodoroStatus.runningShortBreak:
        totalTime = shortBreakTime;
        break;
      case PomodoroStatus.pausedShortBreak:
        totalTime = shortBreakTime;
        break;
      case PomodoroStatus.runningLongBreak:
        totalTime = longBreakTime;
        break;
      case PomodoroStatus.pausedLongBreak:
        totalTime = longBreakTime;
        break;
      case PomodoroStatus.setFinished:
        totalTime = pomodoroTotalTime;
        break;
      // case null:
      //   {}
      //   break;
    }
    double percentage = (totalTime - remainingTime) / totalTime;

    return percentage;
  }

  _mainBtnPressed() {
    switch (pomodoroStatus) {
      case PomodoroStatus.pausedPomodoro:
        _startPomodoroCount();
        break;
      case PomodoroStatus.runningPomodoro:
        _pausePomodoroCount();
        break;
      case PomodoroStatus.runningShortBreak:
        _pauseShortBreakCount();
        break;
      case PomodoroStatus.pausedShortBreak:
        _startShortBreak();
        break;
      case PomodoroStatus.runningLongBreak:
        _pauseLongBreakCount();
        break;
      case PomodoroStatus.pausedLongBreak:
        _startLongBreak();
        break;
      case PomodoroStatus.setFinished:
        setNum++;
        _startPomodoroCount();
        break;
      // case null:
      //   {}
      //   break;
    }
  }

  _startPomodoroCount() {
    pomodoroStatus = PomodoroStatus.runningPomodoro;

    _cancelTimer();
    setState(() {
      toggle = true;
    });

    _timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) => {
              if (remainingTime > 0)
                {
                  setState(() {
                    remainingTime--;
                    pomodoroBtnText = _btnTextPause;
                  })
                }
              else
                {
                  pomodoroNum++,
                  _cancelTimer(),
                  if (pomodoroNum % pomodoroPerSet == 0)
                    {
                      pomodoroStatus = PomodoroStatus.pausedLongBreak,
                      setState(() {
                        remainingTime = longBreakTime;
                        pomodoroBtnText = _btnTextLongBreak;
                      })
                    }
                  else
                    {
                      pomodoroStatus = PomodoroStatus.pausedShortBreak,
                      setState(() {
                        remainingTime = shortBreakTime;
                        pomodoroBtnText = _btnTextShortBreak;
                      })
                    }
                }
            });
  }

  _startShortBreak() {
    pomodoroStatus = PomodoroStatus.runningShortBreak;
    setState(() {
      pomodoroBtnText = _btnTextPause;
    });
    _cancelTimer();
    setState(() {
      toggle = true;
    });
    _timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) => {
              if (remainingTime > 0)
                {
                  setState(() {
                    remainingTime--;
                  })
                }
              else
                {
                  remainingTime = pomodoroTotalTime,
                  _cancelTimer(),
                  pomodoroStatus = PomodoroStatus.pausedPomodoro,
                  setState(() {
                    pomodoroBtnText = _btnTextStart;
                  })
                }
            });
  }

  _startLongBreak() {
    pomodoroStatus = PomodoroStatus.runningLongBreak;
    setState(() {
      pomodoroBtnText = _btnTextPause;
    });
    _cancelTimer();
    setState(() {
      toggle = true;
    });

    _timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) => {
              if (remainingTime > 0)
                {
                  setState(() {
                    remainingTime--;
                  })
                }
              else
                {
                  remainingTime = pomodoroTotalTime,
                  _cancelTimer(),
                  pomodoroStatus = PomodoroStatus.setFinished,
                  setState(() {
                    pomodoroBtnText = _btnTextStartNewSet;
                  })
                }
            });
  }

  _pauseShortBreakCount() {
    pomodoroStatus = PomodoroStatus.pausedShortBreak;
    _pauseBreakCount();
  }

  _pauseLongBreakCount() {
    pomodoroStatus = PomodoroStatus.pausedLongBreak;
    _pauseBreakCount();
  }

  _pausePomodoroCount() {
    pomodoroStatus = PomodoroStatus.pausedPomodoro;
    _cancelTimer();
    setState(() {
      pomodoroBtnText = _btnTextResume;
    });
  }

  _resetPomodoroCount() {
    pomodoroNum = 0;
    setNum = 0;
    _cancelTimer();
    _stopCountdown();
  }

  _pauseBreakCount() {
    _cancelTimer();
    setState(() {
      pomodoroBtnText = _btnTextResume;
    });
  }

  _stopCountdown() {
    pomodoroStatus = PomodoroStatus.pausedPomodoro;
    setState(() {
      remainingTime = pomodoroTotalTime;
      pomodoroBtnText = _btnTextStart;
    });
  }

  _cancelTimer() {
    setState(() {
      toggle = false;
    });
    if (_timer != null) {
      _timer!.cancel();
    }
  }
}
