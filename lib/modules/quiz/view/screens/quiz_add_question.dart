import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/quiz/controller/quiz_get_controller.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
import 'package:study_first_ggs_later/modules/quiz/services/quiz_catalogue_collection.dart';
// import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class QuizAddQuestion extends StatelessWidget {
  final quizId;
  final QuizModel? quizModel;
  // final QuestionModel? questionModel;
  final QuizCatDB quizCatDB = QuizCatDB();

  QuizAddQuestion({
    Key? key,
    // required this.questionModel,
    required this.quizId,
    required this.quizModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final QuizController quizController = Get.put(QuizController());
    final quizController = Get.find<QuizController>();

    return Material(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: quizController.quizFormKey,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Enter a question' : null,
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: quizController.questionController,
                  decoration: const InputDecoration(hintText: 'Question'),
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Enter the Correct Answer' : null,
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: quizController.option1Controller,
                  decoration: const InputDecoration(
                      hintText: 'Option 1 (Correct Answer)'),
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Enter an Option' : null,
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: quizController.option2Controller,
                  decoration: const InputDecoration(hintText: 'Option 2'),
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Enter an Option' : null,
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: quizController.option3Controller,
                  decoration: const InputDecoration(hintText: 'Option 3'),
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Enter an Option' : null,
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: quizController.option4Controller,
                  decoration: const InputDecoration(hintText: 'Option 4'),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () async {

              //     final SharedPreferences prefs =
              //         await SharedPreferences.getInstance();

              //     final quizId = prefs.getString('quizId');

              //     // final ref = FirebaseFirestore.instance
              //     //     .collection('Quizzes')
              //     //     .doc();
              //     // ref.get().then((DocumentSnapshot doc) {
              //     //   quizModel = QuizModel.fromMap(
              //     //       doc.data() as Map<String, dynamic>);
              //     //   quizId = quizModel!.quizId;
              //     //   debugPrint('Quiz ID: $quizId');
              //     // });
              //     quizCatDB.addQuestionToQuiz(
              //         question: quizController.question.value,
              //         option1: quizController.option1.value,
              //         option2: quizController.option2.value,
              //         option3: quizController.option3.value,
              //         option4: quizController.option4.value,
              //         quizId: quizId);
              //     debugPrint('${quizController.hasQuestionField.value}'
              //         ' ${quizController.question.value}'
              //         ' ${quizController.option1.value}'
              //         ' ${quizController.option2.value}'
              //         ' ${quizController.option3.value}'
              //         ' ${quizController.option4.value}'
              //         ' $quizId');
              //     quizController.deleteQuestionField();
              //   },
              //   child: const Text('Add Question'),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
