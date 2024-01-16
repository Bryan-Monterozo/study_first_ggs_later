// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
import 'package:study_first_ggs_later/modules/quiz/view/screens/quiz_play.dart';
import 'package:study_first_ggs_later/modules/quiz/view/screens/quiz_play_v2.dart';
import 'package:study_first_ggs_later/modules/quiz/view/screens/quiz_show_questions.dart';

class QuizDialogWidget extends StatelessWidget {
  final QuizModel quizModel;

  const QuizDialogWidget({
    Key? key,
    required this.quizModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        child: Material(
          color: Colors.transparent,
          child: Container(
            // padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 6, 18, 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    quizModel.quizTitle,
                    style: const TextStyle(
                      color: Color(0xFF1c1c1c),
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    quizModel.quizDesc,
                    style: const TextStyle(
                      color: Color(0xFF1c1c1c),
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Poppins',
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Total Questions: 10',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            color: Color(0xFF1c1c1c)),
                      ),
                      Text(
                        'Highscore: 10',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            color: Color(0xFF1c1c1c)),
                      ),
                      Text(
                        'Total Time: 5:00',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          color: Color(0xFF1c1c1c),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFF0B6BA7)),
                        onPressed: () {
                          Get.off(QuizShowQuestions(quizModel: quizModel));
                        },
                        child: const Text(
                          'Edit',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFF0B6BA7)),
                        onPressed: () {
                          Get.off(QuizPlay(
                              quizModel: quizModel, quizId: quizModel.quizId));
                        },
                        child: const Text(
                          'Play',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
