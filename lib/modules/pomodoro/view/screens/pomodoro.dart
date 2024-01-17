library pomodoro_lib;

import 'dart:async';
// import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_first_ggs_later/core/constants/route.dart';
import 'package:study_first_ggs_later/modules/pomodoro/controller/pomodoro_controller.dart';
import 'package:study_first_ggs_later/modules/pomodoro/view/screens/pomodoro_view.dart';
import 'package:study_first_ggs_later/modules/pomodoro/view/widgets/progress_icons.dart';
import 'package:study_first_ggs_later/modules/pomodoro/view/widgets/pomodoro_button.dart';
import 'package:study_first_ggs_later/modules/pomodoro/models/pomodoro_status.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/shared/controller/nav_controller.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';
import 'package:study_first_ggs_later/modules/shared/widgets/loading_screen.dart';
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
  State<Pomodoro> createState() => PomodoroState();
}

// TODO: put to constants folder

class PomodoroState extends State<Pomodoro> {
  String pomodoroBtnText = _btnTextStart;
  PomodoroStatus pomodoroStatus = PomodoroStatus.pausedPomodoro;
  Timer? _timer;
  int pomodoroNum = 0;
  int setNum = 0;
  bool toggle = false;
  bool isLoading = true;
  int minutesLong = 0;
  int minutesShort = 0;
  int minutesRunning = 0;
  int secondsShort = 0;
  int secondsLong = 0;
  int secondsRunning = 0;
  int totalRunning = 0;
  int totalShort = 0;
  int totalLong = 0;
  int remainingTime = 0;

  NavController navController = Get.put(NavController());
  // PomodoroController pomodoroController = Get.put(PomodoroController());

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
    initTimer();
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
        child: Stack(children: [
          Column(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PomodoroButton(
                    onTap: _resetPomodoroCount,
                    buttonIcon: const Icon(Icons.restart_alt_rounded),
                    buttonSize: 30,
                  ),
                  PomodoroButton(
                      onTap: _mainBtnPressed,
                      buttonSize: 80,
                      buttonIcon: toggle == false
                          ? const Icon(
                              Icons.play_arrow_rounded,
                              // size: 40,
                            )
                          : const Icon(
                              Icons.pause_rounded,
                              // size: 40,
                            )),
                  PomodoroButton(
                    onTap: _resetPomodoroCount,
                    buttonSize: 40,
                    buttonIcon: const Icon(
                      Icons.stop_rounded,
                      size: 40,
                    ),
                  ),
                ],
              ),
              PomodoroButton(
                onTap: () async {
                  var refresh = await Get.to(const pomodoroViewPage());
                  _cancelTimer();
                  if (refresh == true) {
                    initTimer();
                  }
                },
                buttonSize: 40,
                buttonIcon: const Icon(
                  Icons.keyboard_control_rounded,
                  // size: 40,
                  color: Color(0xffcecece),
                ),
              ),
            ],
          ),
          isLoading ? const LoadingAnimation() : Container()
        ]),
      ),
    );
  }

// TODO: Refactor this to core/utils named (sec_to_string.dart)

  void initTimer() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    minutesRunning = prefs.getInt('minRunning') ?? 1;
    secondsRunning = prefs.getInt('secRunning') ?? 0;
    minutesShort = prefs.getInt('minShort') ?? 1;
    secondsShort = prefs.getInt('secShort') ?? 0;
    minutesLong = prefs.getInt('minLong') ?? 1;
    secondsLong = prefs.getInt('secLong') ?? 0;
    totalRunning = (minutesRunning * 60) + (secondsRunning);
    totalShort = (minutesShort * 60) + (secondsShort);
    totalLong = (minutesLong * 60) + (secondsLong);
    remainingTime = totalRunning;
    setState(() {
      isLoading = false;
    });
  }

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
        totalTime = totalRunning;
        break;
      case PomodoroStatus.pausedPomodoro:
        totalTime = totalRunning;
        break;
      case PomodoroStatus.runningShortBreak:
        totalTime = totalShort;
        break;
      case PomodoroStatus.pausedShortBreak:
        totalTime = totalShort;
        break;
      case PomodoroStatus.runningLongBreak:
        totalTime = totalLong;
        break;
      case PomodoroStatus.pausedLongBreak:
        totalTime = totalLong;
        break;
      case PomodoroStatus.setFinished:
        totalTime = totalRunning;
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
        PomodoroController().pomodoroPoints(3);
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
                  PomodoroController().pomodoroPoints(1),
                  if (pomodoroNum % pomodoroPerSet == 0)
                    {
                      pomodoroStatus = PomodoroStatus.pausedLongBreak,
                      setState(() {
                        remainingTime = totalLong;
                        pomodoroBtnText = _btnTextLongBreak;
                      })
                    }
                  else
                    {
                      pomodoroStatus = PomodoroStatus.pausedShortBreak,
                      setState(() {
                        remainingTime = totalShort;
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
                  remainingTime = totalRunning,
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
                  remainingTime = totalRunning,
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
      remainingTime = totalRunning;
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
