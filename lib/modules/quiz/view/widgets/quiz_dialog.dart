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
        padding: const EdgeInsets.symmetric(horizontal: 24.0,),
        child: Material(
          color: Colors.transparent,
          child: Container(
            // padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    quizModel.quizTitle,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Center(
                  child: Text(
                    quizModel.quizDesc,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Total Questions: 10',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Highscore: 10',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Total Time: 5:00',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.off(QuizShowQuestions(quizModel: quizModel));
                      },
                      child: const Text('Edit'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.off(QuizPlayv2(
                            quizModel: quizModel, quizId: quizModel.quizId));
                      },
                      child: const Text('Play'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
