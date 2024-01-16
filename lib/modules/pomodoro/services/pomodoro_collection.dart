import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:study_first_ggs_later/modules/pomodoro/models/pomodoro_model.dart';

class PomodoroDB {
  final firestore = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser!.uid;

  void addPomodoroToDB({
    required title,
    required minutesLong,
    required minutesShort,
    required minutesRunning,
    required secondsShort,
    required secondsLong,
    required secondsRunning,
  }) async {
    final collection =
        firestore.collection('Users').doc(uid).collection('Pomodoro').doc();

    PomodoroModel pomodoroModel = PomodoroModel(
      title: title,
      id: collection.id,
      minutesRunning: minutesRunning,
      minutesShort: minutesShort,
      minutesLong: minutesLong,
      secondsRunning: secondsRunning,
      secondsShort: secondsShort,
      secondsLong: secondsLong,
    );

    await collection.set(pomodoroModel.toMap());
  }

  void editPomodoroToDB({
    required title,
    required id,
    required minutesLong,
    required minutesShort,
    required minutesRunning,
    required secondsShort,
    required secondsLong,
    required secondsRunning,
  }) async {
    firestore
        .collection('Users')
        .doc(uid)
        .collection('Pomodoro')
        .doc(id)
        .update({
      'title': title,
      'minutesRunning': minutesRunning,
      'minutesShort': minutesShort,
      'minutesLong': minutesLong,
      'secondsRunning': secondsRunning,
      'secondsShort': secondsShort,
      'secondsLong': secondsLong,
    });
  }

  deletePomodoroToDB({
    required id,
  }) async {
    await firestore
        .collection('Users')
        .doc(uid)
        .collection('Pomodoro')
        .doc(id)
        .delete();
  }
}
