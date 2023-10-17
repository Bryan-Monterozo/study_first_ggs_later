// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/quiz/controller/quiz_get_controller.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
import 'package:study_first_ggs_later/modules/quiz/view/widgets/question_tiles.dart';
import 'package:percent_indicator/percent_indicator.dart';

class QuizShowQuestions extends StatelessWidget {
  final quizId;
  final QuizModel quizModel;
  final QuestionModel? questionModel;

  QuizShowQuestions({
    Key? key,
    required this.quizModel,
    this.questionModel,
    required this.quizId,
  }) : super(key: key);

  final OptionsController optionsController = Get.put(OptionsController());


  // final OptionModel optionModel = OptionModel();
  @override
  Widget build(BuildContext context) {
    debugPrint('onBuild');
    debugPrint('${optionsController.timeLeft.value}');
   
    final questionRef = FirebaseFirestore.instance
        .collection('Quiz')
        .doc(quizModel.quizId)
        .collection('questions');
    // int questionTotal = initQuestionTotal(questionRef);
    // debugPrint('QuizShowQuestionsOnScreen: ${quizModel.quizId}');
    // debugPrint('$questionTotal');
    // Key controllerKey;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    quizModel.quizTitle,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Obx(
                        () => Text(
                          optionsController
                              .secToString(optionsController.timeLeft.value),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(20.0)),
                    GetBuilder<OptionsController>(
                      init: OptionsController(),
                      builder: (controller) => Text(
                        'Question: ${controller.questionNumberInt}/${controller.questionTotal}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Container(
                  // alignment: Alignment.center,
                  child: Expanded(
                    child: Obx(
                      () => LinearPercentIndicator(
                        alignment: MainAxisAlignment.center,
                        width: MediaQuery.of(context).size.width - 50,
                        // animation: true,
                        lineHeight: 30.0,
                        // animationDuration: 1000,
                        percent: (1.00 - optionsController.timePercentage()),
                        center: Text(
                          'Time Remaining: ${optionsController.secToString(optionsController.timeLeft.value)}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.green,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            // padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<QuerySnapshot>(
                future: questionRef.get(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final random = (snapshot.data! as QuerySnapshot).docs.toList()
                    ..shuffle();

                  return PageView.builder(
                      controller: optionsController.nextPage,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        OptionModel optionModel = OptionModel();

                        optionModel.question = random[index]['question'];

                        optionsController.questionTotal.value =
                            snapshot.data!.docs.length;

                        List<String> options = [
                          random[index]['option1'],
                          random[index]['option2'],
                          random[index]['option3'],
                          random[index]['option4'],
                        ];

                        options.shuffle();

                        optionModel.option1 = options[0];
                        optionModel.option2 = options[1];
                        optionModel.option3 = options[2];
                        optionModel.option4 = options[3];
                        optionModel.correctOption = random[index]['option1'];
                        optionModel.answered = false;
                        optionsController.questionTotalFinal();
                        return QuestionTilesWidget(
                          optionModel: optionModel,
                        );
                      });
                }),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  optionsController.nextQuestion();
                },
                child: const Text('Next'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
