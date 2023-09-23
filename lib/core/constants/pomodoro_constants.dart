import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/pomodoro/models/pomodoro_status.dart';

const pomodoroTotalTime = 1 * 60;
const shortBreakTime = 5 * 60;
const longBreakTime = 15 * 60;
const pomodoroPerSet = 4;

const Map<PomodoroStatus, String> statusText = {
  PomodoroStatus.runningPomodoro: 'Pomodoro is Running',
  PomodoroStatus.pausedPomodoro: 'Pomodoro is Paused',
  PomodoroStatus.runningShortBreak: 'Short Break is Running',
  PomodoroStatus.pausedShortBreak: 'Short Break is Paused',
  PomodoroStatus.runningLongBreak: 'Long Break is Running',
  PomodoroStatus.pausedLongBreak: 'Long Break is Paused',
  PomodoroStatus.setFinished: 'Set is Finished',
};

const Map<PomodoroStatus, MaterialColor> statusColor = {
  PomodoroStatus.runningPomodoro: Colors.green,
  PomodoroStatus.pausedPomodoro: Colors.orange,
  PomodoroStatus.runningShortBreak: Colors.red,
  PomodoroStatus.pausedShortBreak: Colors.orange,
  PomodoroStatus.runningLongBreak: Colors.red,
  PomodoroStatus.pausedLongBreak: Colors.orange,
  PomodoroStatus.setFinished: Colors.yellow,
};