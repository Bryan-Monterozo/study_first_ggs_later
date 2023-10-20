// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/quiz/controller/quiz_get_controller.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
import 'package:study_first_ggs_later/modules/quiz/view/widgets/question_tiles.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class QuizPlay extends StatelessWidget {
  final quizId;
  final QuizModel quizModel;
  final QuestionModel? questionModel;

  const QuizPlay({
    Key? key,
    required this.quizModel,
    this.questionModel,
    required this.quizId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // debugPrint('Widget Rebuild');
    final questionRef = FirebaseFirestore.instance
        .collection('Quiz')
        .doc(quizModel.quizId)
        .collection('questions');
    final OptionsController optionsController = Get.put(OptionsController());
    optionsController.answeredCurrent = false;
    return SafeArea(
      child: Scaffold(
        appBar: SharedAppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: quizModel.quizTitle,
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        quizModel.quizTitle,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: GetBuilder<OptionsController>(
                            init: OptionsController(),
                            id: 'timeLeft',
                            builder: (controller) => Text(
                              controller.secToString(controller.timeLeftInt),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(20.0)),
                      Expanded(
                        child: GetBuilder<OptionsController>(
                          id: 'nextQuestion',
                          builder: (controller) => Text(
                            'Question: ${controller.questionNumberInt}/${controller.questionTotal}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 1,
                    // alignment: Alignment.center,
                    child: GetBuilder<OptionsController>(
                      id: 'timeLeft',
                      builder: (controller) => LinearPercentIndicator(
                        alignment: MainAxisAlignment.center,
                        width: MediaQuery.of(context).size.width - 50,
                        lineHeight: 30.0,
                        animation: true,
                        animationDuration: 750,
                        animateFromLastPercent: true,
                        percent: (controller.timePercent),
                        center: Text(
                          'Time Remaining: ${controller.secToString(controller.timeLeftInt)}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.green,
                        backgroundColor: Colors.grey[300],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 4,
              // padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<QuerySnapshot>(
                  future: questionRef.get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final random = snapshot.data!.docs.toList()..shuffle();

                    optionsController.questionTotal.value =
                        snapshot.data!.docs.length;
                    optionsController.questionTotalFinal();
                    return PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: optionsController.nextPage,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          OptionModel optionModel = OptionModel();

                          optionModel.question = random[index]['question'];

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

                          return QuestionTilesWidget(
                            optionModel: optionModel,
                          );
                        });
                  }),
            ),
            Expanded(
              flex: 3,
              child: GetBuilder<OptionsController>(
                id: 'nextQuestionButton',
                builder: (controller) => Visibility(
                  visible: controller.answeredCurrent == true ? true : false,
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            controller.nextQuestion();
                          },
                          child: const Text('Next'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
