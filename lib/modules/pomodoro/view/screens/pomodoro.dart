import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:study_first_ggs_later/core/constants/pomodoro_constants.dart';
import 'package:study_first_ggs_later/modules/pomodoro/view/widgets/progress_icons.dart';
import 'package:study_first_ggs_later/modules/pomodoro/view/widgets/pomodoro_button.dart';
import 'package:study_first_ggs_later/modules/pomodoro/models/pomodoro_status.dart';

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
  const Pomodoro({Key? key}) : super(key: key);

  @override
  State<Pomodoro> createState() => _PomodoroState();
}

const _btnTextStart = 'START SESSION';
const _btnTextShortBreak = 'SHORT BREAK';
const _btnTextResume = 'RESUME SESSION';
const _btnTextLongBreak = 'LONG BREAK';
const _btnTextStartNewSet = 'START NEW SET';
const _btnTextPause = 'PAUSE SESSION';
const _btnTextReset = 'RESET SESSION';

class _PomodoroState extends State<Pomodoro> {
  int remainingTime = pomodoroTotalTime;
  String pomodoroBtnText = _btnTextStart;
  PomodoroStatus pomodoroStatus = PomodoroStatus.pausedPomodoro;
  Timer? _timer;
  int pomodoroNum = 0;
  int setNum = 0;

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

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
                      percent: _getPomodoroPercentage(),
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
                      done: pomodoroNum - (setNum * pomodoroPerSet),
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
                      text: pomodoroBtnText,
                    ),
                    PomodoroButton(
                      onTap: _resetPomodoroCount,
                      text: _btnTextReset,
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
    if (_timer != null) {
      _timer!.cancel();
    }
  }
}
