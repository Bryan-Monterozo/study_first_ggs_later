// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/quiz/controller/quiz_get_controller.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
import 'package:study_first_ggs_later/modules/quiz/services/quiz_catalogue_collection.dart';
import 'package:study_first_ggs_later/modules/quiz/view/widgets/question_tiles.dart';

class QuizShowQuestions extends StatelessWidget {
  final quizId;
  final QuizModel quizModel;
  final QuestionModel? questionModel;
  final OptionModel optionModel = OptionModel();

  QuizShowQuestions({
    Key? key,
    required this.quizModel,
    this.questionModel,
    required this.quizId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final OptionsContoller optionsController = Get.put(OptionsContoller());
    final questionRef = FirebaseFirestore.instance
        .collection('Quiz')
        .doc(quizModel.quizId)
        .collection('questions');

    debugPrint('QuizShowQuestionsOnScreen: ${quizModel.quizId}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: questionRef.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return Container(
                child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          // final quizDataMap = snapshot.data!.docs[index];
                          OptionModel optionModel = OptionModel();  
                          optionModel.question =
                              snapshot.data!.docs[index]['question'];

                          List<String> options = [
                            snapshot.data!.docs[index]['option1'],
                            snapshot.data!.docs[index]['option2'],
                            snapshot.data!.docs[index]['option3'],
                            snapshot.data!.docs[index]['option4'],
                          ];

                          options.shuffle();

                          optionModel.option1 = options[0];
                          optionModel.option2 = options[1];
                          optionModel.option3 = options[2];
                          optionModel.option4 = options[3];
                          optionModel.correctOption = snapshot.data!.docs[index]['option1'];
                          optionModel.answered = false;

                          return QuestionTilesWidget(optionModel: optionModel);
                        }));
          }),
    );
  }
}
