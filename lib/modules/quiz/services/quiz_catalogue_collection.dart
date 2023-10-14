import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';

class QuizCatDB {
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
    await prefs.setString('quizId', collection.id);
    // quizId.value = collection.id;
    // debugPrint('Quiz ID: ${quizId.value}');
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
        quizId: quizId);
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

  cancelQuizCreation({
    required quizId,
  }) async {
    await firestore.collection('Decks').doc(quizId).delete();
    await firestore
        .collection('Quiz')
        .doc(quizId)
        .collection('questions')
        .get()
        .then((questions) {
      for (DocumentSnapshot doc in questions.docs) {
        doc.reference.delete();
      }
    });
  }

  deleteQuizFromDB({
    required quizId,
  }) async {
    await firestore.collection('Quiz').doc(quizId).delete();
    // await firestore
    //     .collection('Quiz')
    //     .doc(quizId)
    //     .collection('questions')
    //     .get()
    //     .then((questions) {
    //   for (DocumentSnapshot doc in questions.docs) {
    //     doc.reference.delete();
    //   }
    // });
  }
}
