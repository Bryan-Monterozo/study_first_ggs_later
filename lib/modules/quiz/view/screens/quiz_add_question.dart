import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
// import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class QuizAddQuestion extends StatelessWidget {
  final quizId;
  // final QuizController quizController = Get.put(QuizController());
  final QuestionModel? questionModel;

  QuizAddQuestion({
    Key? key,
    required this.questionModel,
    required this.quizId,
  }) : super(key: key);

  final question = ''.obs;

  final option1 = ''.obs;

  final option2 = ''.obs;

  final option3 = ''.obs;

  final option4 = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: 
            // Obx(
              TextFormField(
                validator: (value) => value!.isEmpty ? 'Enter a question' : null,
                onChanged: (value) {
                  question.value = value;
                },
                decoration: const InputDecoration(hintText: 'Question'),
              ),
            ),
          // ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: 
            // Obx(
              TextFormField(
                validator: (value) =>
                    value!.isEmpty ? 'Enter the Correct Answer' : null,
                onChanged: (value) {
                  option1.value = value;
                },
                decoration:
                    const InputDecoration(hintText: 'Option 1 (Correct Answer)'),
              ),
            ),
          // ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: 
            // Obx(
              TextFormField(
                validator: (value) => value!.isEmpty ? 'Enter an Option' : null,
                onChanged: (value) {
                  option2.value = value;
                },
                decoration: const InputDecoration(hintText: 'Option 2'),
              ),
            ),
          // ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: 
              // Obx(
              TextFormField(
                validator: (value) => value!.isEmpty ? 'Enter an Option' : null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  option3.value = value;
                },
                decoration: const InputDecoration(hintText: 'Option 3'),
              ),
            ),
          // ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: 
              // Obx(
              TextFormField(
                validator: (value) => value!.isEmpty ? 'Enter an Option' : null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  option4.value = value;
                },
                decoration: const InputDecoration(hintText: 'Option 4'),
              ),
            ),
          // ),
        ],
      ),
    );
  }
}
