import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:study_first_ggs_later/utils/constants.dart';
import 'package:study_first_ggs_later/widgets/progress_icons.dart';
import 'package:study_first_ggs_later/widgets/pomodoro_button.dart';
import 'package:study_first_ggs_later/models/pomodoro_status.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

const _btnTextStart = 'START SESSION';
const _btnTextShortBreak = 'SHORT BREAK';
const _btnTextResume = 'RESUME SESSION';
const _btnTextLongBreak = 'LONG BREAK';
const _btnTextStartNewSet = 'START NEW SET';
const _btnTextPause = 'PAUSE SESSION';
const _btnTextReset = 'RESET SESSION';

class _HomeState extends State<Home> {
  int remainingTime = pomodoroTotalTime;
  String pomodoroBtnText = _btnTextStart;
  PomodoroStatus pomodoroStatus = PomodoroStatus.pausedPomodoro;
  Timer? _timer;
  int pomodoroNum = 0;
  int setNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Pomodoro Timer'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text('Pomodoro number: $pomodoroNum',
                  style: const TextStyle(fontSize: 32, color: Colors.white)),
              const SizedBox(
                height: 10,
              ),
              Text('Set: $setNum',
                  style: const TextStyle(fontSize: 22, color: Colors.white)),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularPercentIndicator(
                      radius: 220.0,
                      lineWidth: 15.0,
                      percent: 0.3,
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Text(
                        _secToString(remainingTime),
                        style:
                            const TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      progressColor: statusColor[pomodoroStatus],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ProgressIcons(
                      total: pomodoroPerSet,
                      done: pomodoroNum - (setNum - pomodoroPerSet),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      statusText[pomodoroStatus]!,
                      style: const TextStyle(color: Colors.white),
                    ),
                    PomodoroButton(
                      onTap: _mainBtnPressed,
                      text: 'Start',
                    ),
                    PomodoroButton(
                      onTap: () {},
                      text: 'Reset',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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

  _mainBtnPressed() {
    switch (pomodoroStatus) {
      case PomodoroStatus.pausedPomodoro:
        _startPomodoroCount();
        break;
      case PomodoroStatus.runningPomodoro:
        {}
        break;
      case PomodoroStatus.runningShortBreak:
        {}
        break;
      case PomodoroStatus.pausedShortBreak:
        {}
        break;
      case PomodoroStatus.runningLongBreak:
        {}
        break;
      case PomodoroStatus.pausedLongBreak:
        {}
        break;
      case PomodoroStatus.setFinished:
        {}
        break;
      // case null:
      //   {}
      //   break;
    }
  }

  _startPomodoroCount() {
    pomodoroStatus = PomodoroStatus.runningPomodoro;

    _cancelTimer();

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
                    } else {
                      pomodoroStatus = PomodoroStatus.pausedShortBreak,
                      setState(() {
                        remainingTime = shortBreakTime;
                        pomodoroBtnText = _btnTextShortBreak;
                      })
                    }
                }
            });
  }

  _cancelTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }
}
