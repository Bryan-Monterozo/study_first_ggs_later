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

  addQuestionToQuiz({
    required question,
    required option1,
    required option2,
    required option3,
    required option4,
    required quizId,
  }) async {

    final collection = firestore
      .collection('Quiz')
      .doc(quizId)
      .collection('questions')
      .doc();

    QuestionModel questionModel = QuestionModel(question: question, option1: option1, option2: option2, option3: option3, option4: option4, quizId: quizId); 
    await collection.set(questionModel.toMap());
  }
}
