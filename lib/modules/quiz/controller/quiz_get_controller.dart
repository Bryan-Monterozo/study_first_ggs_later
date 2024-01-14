// import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_get_controller.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_premade.dart';
import 'package:study_first_ggs_later/modules/quiz/services/quiz_catalogue_collection.dart';
import 'package:study_first_ggs_later/modules/quiz/view/screens/quiz_result.dart';
// import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
// import 'package:study_first_ggs_later/modules/quiz/view/screens/quiz_add_question.dart';

class QuizController extends GetxController {
  QuizCatDB quizCatDB = QuizCatDB();
  PremadeQuiz premade = PremadeQuiz();
  final quizFormKey = GlobalKey<FormState>();
  final quizFormKeyTop = GlobalKey<FormState>();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser!.uid;

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
  // RxString quizIdObx = ''.obs;

  String quizTitleStr = '';

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
    Get.delete<QuizController>();
    super.onClose();
  }

  premadeQuestion() async {
    print('premadeQuestion');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('quizLoaded') == null) {
      final ref =
          await firestore.collection('Users').doc(uid).collection('Quiz').get();
      await prefs.setBool('quizLoaded', true);
      // if (ref.docs.isEmpty) {
      for (int i = 1; i <= 3; i++) {
        quizCatDB
            .addQuizToDB(
                quizTitle: premade.premadeQuizName(i),
                quizDesc: premade.premadeQuizDesc(i))
            .then((value) {
          String id = prefs.getString('quizId')!;
          print('premadeQuizName: ${premade.premadeQuizName(i)}');
          print('premadeQuizDesc: ${premade.premadeQuizDesc(i)}');
          for (int j = 1; j <= 3; j++) {
            quizCatDB.addQuestionToQuiz(
                question: premade.premadeQuestion(j),
                option1: premade.premadeOptions(j)[0],
                option2: premade.premadeOptions(j)[1],
                option3: premade.premadeOptions(j)[2],
                option4: premade.premadeOptions(j)[3],
                quizId: id);
            print('premadeQuestion: ${premade.premadeQuestion(j)}');
            print('premadeOptions: ${premade.premadeOptions(j)}');
          }
        });
      }
      // }
    }
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

  // void editGetQuizId() {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final quizId = prefs.getString('quizId');
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
  //next page
  late PageController nextPage;

  //question total
  final questionTotal = 0.obs;
  final questionNumber = 1.obs;
  int questionNumberInt = 1;
  int questionTotalInt = 0;

  //Quiz Checker
  bool answeredCurrent = false;
  int quizPoints = 0;

  //timer
  final timeLeft = 0.obs;
  int timeLeftX = 0;
  int timeLeftInt = 0;
  String timeLeftMin = '';
  String timeLeftSec = '';
  int totalTime = 0;
  double timePercent = 0.0;
  final qMins = 0.obs;
  final qSecs = ''.obs;
  Timer? timer;

  @override
  void onInit() async {
    nextPage = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void onReady() async {
    // ignore: unused_local_variable
    SharedPreferences prefs = await SharedPreferences.getInstance();
    startTimer();
    debugPrint('Widget Rebuilt');
    super.onReady();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  currentQuestionAnswered() {
    answeredCurrent = true;
    update(['nextQuestionButton']);
  }

  addPoints() {
    quizPoints++;
  }

  nextQuestion() async {
    if (questionNumber.value < questionTotal.value) {
      nextPage.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
      questionNumber.value++;
      questionNumberInt = questionNumber.value;
      debugPrint('onNext');
      debugPrint('${timeLeft.value}');
      answeredCurrent = false;
      update(['nextQuestion', 'nextQuestionButton']);
    } else {
      finishQuiz();
    }
  }

  finishQuiz() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('questionTotalInt', questionTotal.value);
    questionTotalInt = prefs.getInt('questionTotalInt')!;
    await prefs.setInt('quizPoints', quizPoints);
    Get.find<BattleController>().battlePoints();
    Get.off(const QuizResult());
  }

  // Initialize Questionaire

  questionTotalInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('questionTotalInt', questionTotal.value);
    timeLeftInt = questionTotal.value * 60;
    totalTime = questionTotal.value * 60;
    update();
  }

  questionTotalFinal() async {
    questionTotalInit();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: unused_local_variable
    final questionTotalInt = prefs.getInt('questionTotalInt');
    update(['nextQuestion']);
  }

  // For Question Timer

  secToString(int seconds) {
    int roundedMinutes = seconds ~/ 60;
    int remainingSeconds = seconds - (roundedMinutes * 60);
    String remainingSecondsStr;

    if (remainingSeconds < 10) {
      remainingSecondsStr = '0$remainingSeconds';
    } else {
      remainingSecondsStr = remainingSeconds.toString();
    }
    return '$roundedMinutes:$remainingSecondsStr';
  }

  timePercentage() {
    double percentage = 1.00 - ((totalTime - timeLeftInt) / totalTime);
    return percentage;
  }

  startTimer() async {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeftInt > 0) {
        timeLeftInt--;
        timePercent = timePercentage();
        update(['timeLeft']);
      } else {
        timer.cancel();
        finishQuiz();
      }
    });
  }
}
