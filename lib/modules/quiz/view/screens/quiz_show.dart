// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
import 'package:study_first_ggs_later/modules/quiz/view/widgets/question_tiles.dart';

class QuizShowQuestions extends StatelessWidget {
  final quizId;
  final QuizModel quizModel;
  final QuestionModel? questionModel;

  const QuizShowQuestions({
    Key? key,
    required this.quizModel,
    this.questionModel,
    required this.quizId,
  }) : super(key: key);

  // final OptionModel optionModel = OptionModel();
  @override
  Widget build(BuildContext context) {
    
    final questionRef = FirebaseFirestore.instance
        .collection('Quiz')
        .doc(quizModel.quizId)
        .collection('questions');

    debugPrint('QuizShowQuestionsOnScreen: ${quizModel.quizId}');
    // Key controllerKey;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: questionRef.get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                // separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  // controllerKey = GlobalKey();
                  // optionsController.setKey(controllerKey, false);
                  // final quizDataMap = snapshot.data!.docs[index];
                  // optionsController.optionModel.value = OptionModel();
                  OptionModel optionModel = OptionModel();
                  // optionsController.optionModel.value.question =
                  //     snapshot.data!.docs[index]['question'];

                  optionModel.question =
                      snapshot.data!.docs[index]['question'];

                  List<String> options = [
                    snapshot.data!.docs[index]['option1'],
                    snapshot.data!.docs[index]['option2'],
                    snapshot.data!.docs[index]['option3'],
                    snapshot.data!.docs[index]['option4'],
                  ];

                  options.shuffle();

                  // optionsController.optionModel.value.option1 = options[0];
                  // optionsController.optionModel.value.option2 = options[1];
                  // optionsController.optionModel.value.option3 = options[2];
                  // optionsController.optionModel.value.option4 = options[3];
                  // optionsController.optionModel.value.correctOption =
                  //     snapshot.data!.docs[index]['option1'];
                  // optionsController.optionModel.value.answered = false;
                  optionModel.option1 = options[0];
                  optionModel.option2 = options[1];
                  optionModel.option3 = options[2];
                  optionModel.option4 = options[3];
                  optionModel.correctOption = snapshot.data!.docs[index]['option1'];
                  optionModel.answered = false;

                  // debugPrint(
                  //     optionsController.optionModel.value.option1.toString());
                  // debugPrint(
                  //     optionsController.optionModel.value.option2.toString());
                  // debugPrint(
                  //     optionsController.optionModel.value.option3.toString());
                  // debugPrint(
                  //     optionsController.optionModel.value.option4.toString());
                  // debugPrint(optionsController.optionModel.value.correctOption
                  //     .toString());

                  return QuestionTilesWidget(
                    optionModel: optionModel,
                  );
                });
          }),
    );
  }
}
