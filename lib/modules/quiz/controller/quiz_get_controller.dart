// import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
// import 'package:study_first_ggs_later/modules/quiz/view/screens/quiz_add_question.dart';

class QuizController extends GetxController {

  RxBool hasQuestionField = false.obs;
  RxString question = ''.obs;
  RxString option1 = ''.obs;
  RxString option2 = ''.obs;
  RxString option3 = ''.obs;
  RxString option4 = ''.obs;

  void removeQuestionButton() {
    hasQuestionField.value = true;
  }

  void addQuestionButton() {
    hasQuestionField.value = false;
  }

  void deleteQuestionField() {
    question.value = '';
    option1.value = '';
    option2.value = '';
    option3.value = '';
    option4.value = '';
  }
}
