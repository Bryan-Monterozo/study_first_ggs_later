// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/quiz/controller/quiz_get_controller.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
import 'package:study_first_ggs_later/modules/quiz/view/widgets/question_tilesv2.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class QuizPlayv2 extends StatelessWidget {
  final quizId;
  final QuizModel quizModel;
  final QuestionModel? questionModel;

  const QuizPlayv2({
    Key? key,
    required this.quizModel,
    this.questionModel,
    required this.quizId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // debugPrint('Widget Rebuild');
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final questionRef = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
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
          body: Stack(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(
              //   height: 50,
              // ),
              Positioned(
                top: 30,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: FutureBuilder<QuerySnapshot>(
                      future: questionRef.get(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
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
                              optionModel.correctOption =
                                  random[index]['option1'];
                              optionModel.answered = false;

                              return QuestionTilesWidget(
                                currentQuestion: index+1,
                                questionNumber: snapshot.data!.docs.length,
                                optionModel: optionModel,
                              );
                            });
                      }),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: MediaQuery.of(context).size.height - 150,
                child: SizedBox(
                  width: 10.0,
                  height: 20.0,
                  child: OverflowBox(
                    minWidth: 0.0,
                    maxWidth: 80.0,
                    minHeight: 0.0,
                    maxHeight: 80.0,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: GetBuilder<OptionsController>(
                        id: 'timeLeft',
                        builder: (controller) => CircularPercentIndicator(
                          percent: (controller.timePercent),
                          radius: 60,
                          lineWidth: 5,
                          animation: true,
                          animateFromLastPercent: true,
                          progressColor: const Color(0xFF57BA5E),
                          backgroundColor: Colors.white,
                          center: Text(
                            '${controller.secToString(controller.timeLeftInt)}',
                            style: const TextStyle(
                                fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Expanded(
              //   flex: 1,
              //   child: GetBuilder<OptionsController>(
              //     id: 'nextQuestionButton',
              //     builder: (controller) => Visibility(
              //       visible:
              //           controller.answeredCurrent == true ? true : false,
              //       child: Container(
              //         alignment: Alignment.center,
              //         child: Column(
              //           children: [
              //             ElevatedButton(
              //               onPressed: () {
              //                 controller.nextQuestion();
              //               },
              //               child: const Text('Next'),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          )),
    );
  }
}
