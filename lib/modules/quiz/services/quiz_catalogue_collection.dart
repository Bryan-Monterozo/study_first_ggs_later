import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';

class QuizCatDB extends GetxController {
  
  final firestore = FirebaseFirestore.instance;
  RxString quizId = ''.obs;

  void addQuizToDB({
    required quizTitle,
    required quizDesc,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final collection = firestore.collection('Quiz').doc();

    QuizModel quizModel = QuizModel(
        quizTitle: quizTitle, quizDesc: quizDesc, quizId: collection.id);

    await collection.set(quizModel.toMap());
    quizId.value = collection.id;
    debugPrint('Quiz ID: ${quizId.value}');
    await prefs.setString('quizId', collection.id);
  }

  addQuestionToQuiz({
    required question,
    required option1,
    required option2,
    required option3,
    required option4,
    required quizId,
  }) async {
    final collection =
        firestore.collection('Quiz').doc(quizId).collection('questions').doc();

    QuestionModel questionModel = QuestionModel(
        question: question,
        option1: option1,
        option2: option2,
        option3: option3,
        option4: option4,
        quizId: collection.id);
    await collection.set(questionModel.toMap());
  }

  saveCatalogueToDB(
      {required quizTitle, required quizDesc, required quizId}) async {
    final collection = firestore.collection('Quiz').doc(quizId);
    await collection.update({
      'quizTitle': quizTitle,
      'quizDesc': quizDesc,
    });
  }
}
