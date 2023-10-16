// import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
import 'package:study_first_ggs_later/modules/quiz/services/quiz_catalogue_collection.dart';
// import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
// import 'package:study_first_ggs_later/modules/quiz/view/screens/quiz_add_question.dart';

class QuizController extends GetxController {
  QuizCatDB quizCatDB = QuizCatDB();
  final quizFormKey = GlobalKey<FormState>();
  final quizFormKeyTop = GlobalKey<FormState>();

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
  void onInit() async {
    super.onInit();
    hasQuestionField.value = false;
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

  @override
  void onClose() {
    super.onClose();
    questionController.dispose();
    option1Controller.dispose();
    option2Controller.dispose();
    option3Controller.dispose();
    option4Controller.dispose();
  }

  questionValidation() async {
    final isValid = quizFormKey.currentState!.validate();
    if (isValid) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final quizId = prefs.getString('quizId');
      quizCatDB.addQuestionToQuiz(
          question: question.value,
          option1: option1.value,
          option2: option2.value,
          option3: option3.value,
          option4: option4.value,
          quizId: quizId);
      deleteQuestionField();
    } else {
      Get.snackbar(
        'Quiz',
        'Please fill up all the fields',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
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

// class OptionsContoller extends GetxController {
//   final QuizCatDB quizCatDB = QuizCatDB();
//   QuerySnapshot? querySnapshot;
//   final quizId = ''.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     debugPrint('quizId: ${quizId.value}');
//     quizCatDB.getQuizFromDb(quizId: quizId.value).then((value) {
//       querySnapshot = value;
//     });
    
//   }

//   OptionModel getQuestionFromDatasnapshot(DocumentSnapshot questionSnapshot) {
//     OptionModel optionModel = OptionModel();
//     optionModel.question = questionSnapshot['question'];

//     List<String> options = [
//       questionSnapshot['option1'],
//       questionSnapshot['option2'],
//       questionSnapshot['option3'],
//       questionSnapshot['option4'],
//     ];

//     options.shuffle();

//     optionModel.option1 = options[0];
//     optionModel.option2 = options[1];
//     optionModel.option3 = options[2];
//     optionModel.option4 = options[3];
//     optionModel.correctOption = questionSnapshot['option1'];
//     optionModel.answered = false;

//     return optionModel;
//   }
// }
