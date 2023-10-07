import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';

class QuizCatDB {
  final firestore = FirebaseFirestore.instance;

  void addQuizToDB({
    required quizTitle,
    required quizDesc,
  }) async {
    final collection = firestore.collection('Quiz').doc();

    QuizModel quizModel = QuizModel(
        quizTitle: quizTitle, quizDesc: quizDesc, quizId: collection.id);

    await collection.set(quizModel.toMap());
  }
}
