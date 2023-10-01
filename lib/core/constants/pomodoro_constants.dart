// import 'package:flutter/material.dart';
// import 'package:study_first_ggs_later/modules/pomodoro/models/pomodoro_status.dart';

// library pomodoro_constants;

part of pomodoro_lib;

const pomodoroTotalTime = 1 * 10; // 25 minutes
const shortBreakTime = 1 * 10; // 5 minutes
const longBreakTime = 1 * 10; // 15 minutes
const pomodoroPerSet = 4; // 4 pomodoros per set

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

const _btnTextStart = 'Start Session';
const _btnTextShortBreak = 'Short Break';
const _btnTextResume = 'Resume Session';
const _btnTextLongBreak = 'Long Break';
const _btnTextStartNewSet = 'Start New Session';
const _btnTextPause = 'Pause Session';
const _btnTextReset = 'Reset Session';