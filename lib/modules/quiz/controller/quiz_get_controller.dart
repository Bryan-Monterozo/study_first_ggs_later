// import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    questionController.dispose();
    option1Controller.dispose();
    option2Controller.dispose();
    option3Controller.dispose();
    option4Controller.dispose();
    super.onClose();
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
  late PageController nextPage;
  final questionTotal = 0.obs;
  final questionNumber = 1.obs;
  int questionNumberInt = 1;
  int totalTime = 0;
  final timeLeft = 0.obs;
  int timeLeftInt = 0;
  final qMins = 0.obs;
  final qSecs = ''.obs;
  Timer? timer;
  // int questionTotalInt = 0;

  // final nextPageView = PageController(initialPage: 0);

  @override
  void onInit() {
    nextPage = PageController(initialPage: 0);
    startTimer();
    debugPrint('onInit');
    debugPrint('${timeLeft.value}');
    super.onInit();
    // questionTotalInt = questionTotal.value;
  }

  @override
  void onClose() {
    nextPage.dispose();
    timer?.cancel();
    super.onClose();
  }

  void nextQuestion() {
    if (questionNumber.value < questionTotal.value) {
      nextPage.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
      questionNumber.value++;
      questionNumberInt = questionNumber.value;
      debugPrint('onNext');
      debugPrint('${timeLeft.value}');
      update();
    }
  }

  void questionTotalInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('questionTotalInt', questionTotal.value);
  }

  questionTotalFinal() async {
    questionTotalInit();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: unused_local_variable
    final questionTotalInt = prefs.getInt('questionTotalInt');
    timeLeft.value = questionTotal.value * 60;
    timeLeftInt = timeLeft.value;
    totalTime = questionTotal.value * 60;
    update();
  }

  secToString(int seconds) {
    int roundedMinutes = seconds ~/ 60;
    int remainingSeconds = seconds - (roundedMinutes * 60);
    String remainingSecondsStr;

    if (remainingSeconds < 10) {
      remainingSecondsStr = '0$remainingSeconds';
    } else {
      remainingSecondsStr = remainingSeconds.toString();
    }

    qMins.value = roundedMinutes;
    qSecs.value = remainingSecondsStr;

    return '$roundedMinutes:$remainingSecondsStr';
  }

  timePercentage() {
    double percentage = (totalTime - timeLeft.value) / totalTime;
    return percentage;
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft.value > 0) {
        timeLeft.value--;
      } else {
        timer.cancel();
      }
    });
  }
}
