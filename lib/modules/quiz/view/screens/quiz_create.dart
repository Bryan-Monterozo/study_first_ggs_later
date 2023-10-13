import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/quiz/controller/quiz_get_controller.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
import 'package:study_first_ggs_later/modules/quiz/view/screens/quiz_add_question.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
// import 'package:study_first_ggs_later/modules/quiz/services/quiz_catalogue_collection.dart';

class QuizCreate extends StatelessWidget {
  final QuizController quizController = Get.put(QuizController());
  final QuestionModel? questionModel;
  final quizId;

  QuizCreate({
    super.key,
    this.questionModel,
    this.quizId,
  });

  @override
  Widget build(BuildContext context) {
    String quizTitle = '';
    String quizDesc = '';

    return Scaffold(
      appBar: SharedAppBar(
        leading: leadingBack(context),
        title: 'Create a Quiz',
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              // QuizCatDB().addQuizToDB(
              //   quizTitle: quizTitle,
              //   quizDesc: quizDesc,);
              // Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Builder(builder: (context) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Obx(
            () => Column(
              children: [
                Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: TextFormField(
                    maxLength: 60,
                    validator: (value) =>
                        value!.isEmpty ? 'Enter a title' : null,
                    initialValue: quizTitle,
                    onChanged: (value) {
                      quizTitle = value;
                    },
                    decoration: const InputDecoration(hintText: 'Quiz Title'),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: TextFormField(
                    maxLength: 60,
                    validator: (value) =>
                        value!.isEmpty ? 'Enter a title' : null,
                    initialValue: quizDesc,
                    onChanged: (value) {
                      quizDesc = value;
                    },
                    decoration: const InputDecoration(hintText: 'Description'),
                  ),
                ),
                quizController.hasQuestionField.value == false
                    ? Container(
                        margin: const EdgeInsets.all(30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    quizController.removeQuestionButton();
                                    debugPrint(
                                        '${quizController.hasQuestionField.value}');
                                  },
                                  child: const Text('Add Question')),
                            ]),
                      )
                    : Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        child: QuizAddQuestion(
                          questionModel: questionModel,
                          quizId: quizId,
                        )),
                quizController.hasQuestionField.value == true
                    ? ElevatedButton(
                        onPressed: () {
                          quizController.deleteQuestionField();
                          debugPrint(
                              '${quizController.hasQuestionField.value}');
                        },
                        child: const Text('Add Question'),
                      )
                    : Container(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
