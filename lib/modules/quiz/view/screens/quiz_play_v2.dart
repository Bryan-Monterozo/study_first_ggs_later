// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
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
    final questionRef = FirebaseFirestore.instance
        .collection('Quiz')
        .doc(quizModel.quizId)
        .collection('questions');
    // final OptionsController optionsController = Get.put(OptionsController());
    // optionsController.answeredCurrent = false;
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      width: 300.0,
                      height: 90.0,
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Align(
                        alignment: const Alignment(0.0, -1.5),
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
                              child: CircularPercentIndicator(
                                percent: 0.5,
                                radius: 60,
                                lineWidth: 5,
                                animation: true,
                                animateFromLastPercent: true,
                                progressColor: Color(0xFF57BA5E),
                                backgroundColor: Colors.white,
                                center: const Text(
                                  '0:0',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0.0, -5.0),
                      child: SizedBox(
                        width: 10.0,
                        height: 20.0,
                        child: OverflowBox(
                          minWidth: 0.0,
                          maxWidth: 300.0,
                          minHeight: 0.0,
                          maxHeight: 130.0,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(top: 12),
                            decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Question 1/5',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'Insert Question Here Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam molestie.',
                                      style: TextStyle(fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60.0,
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(top: 12),
                          width: 200.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Text(
                              'Option A',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(top: 12),
                          width: 200.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Text(
                              'Option B',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(top: 12),
                          width: 200.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Text(
                              'Option C',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(top: 12),
                          width: 200.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 2, color: Colors.blue)),
                          child: const Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Text(
                              'Option D',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(top: 12),
                          width: 200.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
