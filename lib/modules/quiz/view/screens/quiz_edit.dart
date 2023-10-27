import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_first_ggs_later/modules/quiz/controller/quiz_get_controller.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
import 'package:study_first_ggs_later/modules/quiz/services/quiz_catalogue_collection.dart';
import 'package:study_first_ggs_later/modules/quiz/view/screens/quiz_add_question.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class QuizEdit extends StatelessWidget {
  // final QuestionModel questionModel;
  final QuizModel quizModel;
  final quizId;

  const QuizEdit({
    super.key,
    // required this.questionModel,
    required this.quizModel,
    required this.quizId,
  });

  @override
  Widget build(BuildContext context) {
    Get.delete<QuizController>();
    final QuizController quizController = Get.put(QuizController());
    final QuizCatDB quizCatDB = QuizCatDB();
    String quizTitle = '';
    String quizDesc = '';
    debugPrint('Quiz ID: $quizId');
    // QuizModel? quizModel;
    return Scaffold(
      appBar: SharedAppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () async {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            // quizCatDB.deleteQuizFromDB(quizId: quizId);
            prefs.remove('quizId');
            Get.back();
          },
        ),
        title: quizTitle,
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
            onPressed: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              // final quizId = prefs.getString('quizId');
              // quizCatDB.deleteQuizFromDB(quizId: quizId);
              prefs.remove('quizId');
              Get.back();
            },
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () async {
              final isValid =
                  quizController.quizFormKeyTop.currentState!.validate();
              // final SharedPreferences prefs =
              //     await SharedPreferences.getInstance();
              // final quizId = prefs.getString('quizId');
              if (quizController.hasQuestionField.value == false) {
                if (isValid) {
                  // final SharedPreferences prefs = await SharedPreferences.getInstance();
                  // final quizId = prefs.getString('quizId');
                  quizController.removeQuestionButton();
                  quizCatDB.saveCatalogueToDB(
                      quizTitle: quizTitle,
                      quizDesc: quizDesc,
                      quizId: quizModel.quizId);
                  quizController.hasQuestionField.value = true;
                } else {
                  Get.snackbar(
                    'Quiz',
                    'Please fill up all the fields',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              } else {
                if (isValid) {
                  quizController.removeQuestionButton();
                } else {
                  Get.snackbar(
                    'Quiz',
                    'Please fill up all the fields',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              }
              // quizId == null
              //     ? quizCatDB.addQuizToDB(
              //         quizTitle: quizTitle, quizDesc: quizDesc)
              //     : quizCatDB.saveCatalogueToDB(
              //         quizTitle: quizTitle, quizDesc: quizDesc, quizId: quizId);
              // prefs.remove('quizId');
              Get.back(result: quizTitle);
            },
          ),
        ],
      ),
      body: Builder(builder: (context) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child:
              // Obx(
              Form(
            key: quizController.quizFormKeyTop,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: TextFormField(
                    maxLength: 60,
                    validator: (value) =>
                        value!.isEmpty ? 'Enter a title' : null,
                    initialValue: quizModel.quizTitle,
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
                        value!.isEmpty ? 'Enter a description' : null,
                    initialValue: quizModel.quizDesc,
                    onChanged: (value) {
                      quizDesc = value;
                    },
                    decoration: const InputDecoration(hintText: 'Description'),
                  ),
                ),
                Obx(
                  () => quizController.hasQuestionField.value == false
                      ? Container(
                          margin: const EdgeInsets.all(30),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    onPressed: () async {
                                      final isValid = quizController
                                          .quizFormKeyTop.currentState!
                                          .validate();
                                      if (isValid) {
                                        final SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        prefs.setString('quizId', quizId);
                                        quizController.removeQuestionButton();
                                        // quizCatDB.saveCatalogueToDB(
                                        //     quizTitle: quizModel.quizTitle,
                                        //     quizDesc: quizModel.quizDesc,
                                        //     quizId: quizModel.quizId);
                                        quizController.hasQuestionField.value =
                                            true;
                                      } else {
                                        Get.snackbar(
                                          'Quiz',
                                          'Please fill up all the fields',
                                          snackPosition: SnackPosition.BOTTOM,
                                        );
                                      }
                                    },
                                    child: const Text('Add Question')),
                              ]),
                        )
                      : Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          child: QuizAddQuestion(
                            quizModel: quizModel,
                            quizId: quizId,
                          )),
                ),
                Obx(
                  () => quizController.hasQuestionField.value == true
                      ? ElevatedButton(
                          onPressed: () async {
                            quizController.questionValidation();
                          },
                          child: const Text('Add More Question'),
                        )
                      : Container(),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
