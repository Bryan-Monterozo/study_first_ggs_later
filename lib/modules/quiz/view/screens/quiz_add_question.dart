import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/quiz/controller/quiz_get_controller.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
// import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class QuizAddQuestion extends GetView<QuizController> {
  final quizId;
  final QuestionModel? questionModel;

  QuizAddQuestion({
    Key? key,
    required this.questionModel,
    required this.quizId,
  }) : super(key: key);

  // final question = ''.obs;

  // final option1 = ''.obs;

  // final option2 = ''.obs;

  // final option3 = ''.obs;

  // final option4 = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Obx(
        () => Column(
          children: [
            Obx(
              () => Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Obx(
                  () => TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? 'Enter a question' : null,
                    onChanged: (value) {
                      controller.question.value = value;
                    },
                    decoration: const InputDecoration(hintText: 'Question'),
                  ),
                ),
              ),
            ),
            Obx(
              () => Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Obx(
                  () => TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? 'Enter the Correct Answer' : null,
                    onChanged: (value) {
                      controller.option1.value = value;
                    },
                    decoration: const InputDecoration(
                        hintText: 'Option 1 (Correct Answer)'),
                  ),
                ),
              ),
            ),
            Obx(
              () => Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Obx(
                  () => TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? 'Enter an Option' : null,
                    onChanged: (value) {
                      controller.option2.value = value;
                    },
                    decoration: const InputDecoration(hintText: 'Option 2'),
                  ),
                ),
              ),
            ),
            Obx(
              () => Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Obx(
                  () => TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? 'Enter an Option' : null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) {
                      controller.option3.value = value;
                    },
                    decoration: const InputDecoration(hintText: 'Option 3'),
                  ),
                ),
              ),
            ),
            Obx(
              () => Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Obx(
                  () => TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? 'Enter an Option' : null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) {
                      controller.option4.value = value;
                    },
                    decoration: const InputDecoration(hintText: 'Option 4'),
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
