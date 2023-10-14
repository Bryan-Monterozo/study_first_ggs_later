// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
// import 'package:study_first_ggs_later/modules/quiz/view/screens/quiz_add_question.dart';

class QuizController extends GetxController {
  TextEditingController questionController = TextEditingController();
  TextEditingController option1Controller = TextEditingController();
  TextEditingController option2Controller = TextEditingController();
  TextEditingController option3Controller = TextEditingController();
  TextEditingController option4Controller = TextEditingController();

  RxBool hasQuestionField = false.obs;
  RxString question = ''.obs;
  RxString option1 = ''.obs;
  RxString option2 = ''.obs;
  RxString option3 = ''.obs;
  RxString option4 = ''.obs;

  @override
  void onInit() {
    super.onInit();
    questionController = TextEditingController(text: question.value);
    option1Controller = TextEditingController(text: option1.value);
    option2Controller = TextEditingController(text: option2.value);
    option3Controller = TextEditingController(text: option3.value);
    option4Controller = TextEditingController(text: option4.value);

    questionController.addListener(() {
      question.value = questionController.text;
    });
    option1Controller.addListener(() {
      option1.value = option1Controller.text;
    });
    option2Controller.addListener(() {
      option2.value = option2Controller.text;
    });
    option3Controller.addListener(() {
      option3.value = option3Controller.text;
    });
    option4Controller.addListener(() {
      option4.value = option4Controller.text;
    });
  }

  // updateQuizID({
  //   required quizId,
  // }) async {
  //   final ref = FirebaseFirestore.instance.collection('Quiz').doc(quizId);
  //   ref.get().then((DocumentSnapshot doc) {
  //     QuizModel quizModel = QuizModel.fromMap(doc.data() as Map<String, dynamic>);
  //     quizId = quizModel.quizId;
  //     debugPrint('Quiz ID: $quizId');
  //   });
  // }

  void removeQuestionButton() {
    hasQuestionField.value = true;
  }

  void addQuestionButton() {
    hasQuestionField.value = false;
  }

  void deleteQuestionField() {
    questionController.clear();
    option1Controller.clear();
    option2Controller.clear();
    option3Controller.clear();
    option4Controller.clear();
  }
}
