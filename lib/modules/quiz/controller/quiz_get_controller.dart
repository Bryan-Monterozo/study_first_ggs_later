// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
import 'package:study_first_ggs_later/modules/quiz/services/quiz_catalogue_collection.dart';
import 'package:study_first_ggs_later/modules/quiz/view/widgets/question_tiles.dart';
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

class OptionsController extends GetxController {
  // final optionModel = OptionModel().obs;
  // // final OptionModel optionModel2 = OptionModel();
  // // final optionSelected = ''.obs;
  // final OptionModel optionModels = OptionModel();
  // final colorChange = [].obs;
  // String optionSelected = '';
  // final questionList = [].obs;
  // // final optionMap = <Key, bool>{}.obs;

  // void pickAns(String option) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // final optionId = prefs.getString('optionId');
  //   optionSelected = option;
  //   update();
  // }

  // @override
  // void onInit() {
  //   debugPrint(optionModel.value.option1.toString());
  //   debugPrint(optionModel.value.option2.toString());
  //   debugPrint(optionModel.value.option3.toString());
  //   debugPrint(optionModel.value.option4.toString());
  //   debugPrint(optionModel.value.correctOption.toString());
  //   super.onInit();
  // }

  // void setKey(Key key, bool value) {
  //   optionMap[key] = value;
  // }

  // void changeKeyVal(Key key) {
  //   if (optionMap[key] != null) {
  //     optionMap[key] = !optionMap[key]!;
  //   }
  // }

  // bool getKeyVal(Key key) {
  //   if (optionMap[key] != null) {
  //     return optionMap[key]!;
  //   }
  //   return false;
  // }

  // void selectedOption1() {
  //   if (optionModel.value.answered == false) {
  //     if (optionModel.value.option1 == optionModel.value.correctOption) {
  //       optionSelected.value = optionModel.value.option1!;
  //       optionModel.value.answered = true;
  //       debugPrint(optionModel.value.answered.toString());
  //       debugPrint(optionModel.value.option1.toString());
  //       debugPrint(optionModel.value.correctOption.toString());
  //       debugPrint(optionSelected.value);
  //     }
  //   } else {
  //     optionSelected.value = optionModel.value.option1!;
  //     optionModel.value.answered = true;
  //   }
  // }

  // void selectedOption2() {
  //   if (optionModel.value.answered == false) {
  //     if (optionModel.value.option2 == optionModel.value.correctOption) {
  //       optionSelected.value = optionModel.value.option2!;
  //       optionModel.value.answered = true;
  //     }
  //   } else {
  //     optionSelected.value = optionModel.value.option2!;
  //     optionModel.value.answered = true;
  //   }
  // }

  // void selectedOption3() {
  //   if (optionModel.value.answered == false) {
  //     if (optionModel.value.option3 == optionModel.value.correctOption) {
  //       optionSelected.value = optionModel.value.option3!;
  //       optionModel.value.answered = true;
  //     }
  //   } else {
  //     optionSelected.value = optionModel.value.option3!;
  //     optionModel.value.answered = true;
  //   }
  // }

  // void selectedOption4() {
  //   if (optionModel.value.answered == false) {
  //     if (optionModel.value.option4 == optionModel.value.correctOption) {
  //       optionSelected.value = optionModel.value.option4!;
  //       optionModel.value.answered = true;
  //     }
  //   } else {
  //     optionSelected.value = optionModel.value.option4!;
  //     optionModel.value.answered = true;
  //   }
  // }
}
