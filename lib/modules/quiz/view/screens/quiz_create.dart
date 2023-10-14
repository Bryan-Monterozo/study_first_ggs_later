import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_first_ggs_later/modules/quiz/controller/quiz_get_controller.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
import 'package:study_first_ggs_later/modules/quiz/services/quiz_catalogue_collection.dart';
import 'package:study_first_ggs_later/modules/quiz/view/screens/quiz_add_question.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
// import 'package:study_first_ggs_later/modules/quiz/services/quiz_catalogue_collection.dart';

class QuizCreate extends StatelessWidget {
  final QuizController quizController = Get.put(QuizController());
  final QuizCatDB quizDBController = Get.put(QuizCatDB());
  final QuestionModel? questionModel;
  // final QuizModel quizModel;
  final QuizCatDB quizCatDB = QuizCatDB();
  final quizId;

  QuizCreate({
    super.key,
    this.questionModel,
    this.quizId,
    // this.quizModel,
  });

  @override
  Widget build(BuildContext context) {
    String quizTitle = '';
    String quizDesc = '';

    QuizModel? quizModel;

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
          child:
              // Obx(
              Column(
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextFormField(
                  maxLength: 60,
                  validator: (value) => value!.isEmpty ? 'Enter a title' : null,
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
                  validator: (value) => value!.isEmpty ? 'Enter a title' : null,
                  initialValue: quizDesc,
                  onChanged: (value) {
                    quizDesc = value;
                  },
                  decoration: const InputDecoration(hintText: 'Description'),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            final SharedPreferences prefs = await SharedPreferences.getInstance();
                            // final ref = FirebaseFirestore.instance
                            //     .collection('Quizzes')
                            //     .doc(quizId);
                            quizController.removeQuestionButton();
                            quizCatDB.addQuizToDB(
                                quizTitle: quizTitle, quizDesc: quizDesc);
                            final getQuizId = quizDBController.quizId.value;
                            debugPrint('Quiz GETX ID: $getQuizId');
                            final quizId = prefs.getString('quizId');

                            // debugPrint('quizId: $quizId');
                            // quizModel = QuizModel(
                            //   quizId: ref.id,
                            //   quizTitle: quizTitle,
                            //   quizDesc: quizDesc,
                            // );
                            Get.to(QuizAddQuestion(
                              quizId: quizId,
                              quizModel: quizModel,
                            ));
                          },
                          child: const Text('Add Question')),
                    ]),
              ),
            ],
          ),
          // ),
        );
      }),
    );
  }
}
