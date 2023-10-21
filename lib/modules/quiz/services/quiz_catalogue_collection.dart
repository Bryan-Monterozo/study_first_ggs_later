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
      quizId: quizId,
      questionId: collection.id,
    );
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
    await firestore.collection('Quiz').doc(quizId).delete();
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

  getQuizFromDb({
    required quizId,
  }) async {
    final quizRef = FirebaseFirestore.instance
        .collection('Quiz')
        .doc(quizId)
        .collection('questions')
        .get();
    return quizRef;
  }

  editQuestionFromQuiz({
    required quizId,
    required questionId,
    required question,
    required option1,
    required option2,
    required option3,
    required option4,
  }) async {
    final collection = firestore
        .collection('Quiz')
        .doc(quizId)
        .collection('questions')
        .doc(questionId);

    await collection.update({
      'question': question,
      'option1': option1,
      'option2': option2,
      'option3': option3,
      'option4': option4,
    });
  }

  // retrieveOptions({required quizId, required questionId}) async {
  //   final optionsRef = firestore
  //       .collection('Quiz')
  //       .doc(quizId)
  //       .collection('questions')
  //       .doc(questionId);
  //   // List<String> optionsList = List<String>.from(optionsRef);

  //   final optionSnaps = optionsRef.snapshots();

  //   List<String> optionsList = snapshot.data()!['options'] as List<String>;
  //   // optionsRef.snapshots().listen((doc) {
  //   //   doc.data()!.forEach((key, value) {
  //   //     correct = data['option1'];
  //   //    });
  //   // })

// QuizModel quizModel = QuizModel.fromMap(
//                       fcDataMap.data() as Map<String, dynamic>);
  //   return optionsList;
  // }
}
