// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OptionsTilesWidget extends StatelessWidget {
  final String option, description, correctAnswer, optionSelected;
  // final QuestionModel questionModel;
  // final QuizModel quizModel;
  // final questionId;

  const OptionsTilesWidget({
    Key? key,
    required this.option,
    required this.description,
    required this.correctAnswer,
    required this.optionSelected,
    // required this.questionModel,
    // required this.quizModel,
    // required this.questionId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final opRef = FirebaseFirestore.instance
    //     .collection('Quiz')
    //     .doc(quizModel.quizId)
    //     .collection('Questions')
    //     .doc(questionId)
    //     .get();

    // final op1 = opRef.then((value) => value['option1']);
    // final op2 = opRef.then((value) => value['option2']);
    // final op3 = opRef.then((value) => value['option3']);
    // final op4 = opRef.then((value) => value['option4']);

    // List optionsList = [
    //   op1.toString(),
    //   op2.toString(),
    //   op3.toString(),
    //   op4.toString()
    // ];

    // List shuffledList = optionsList..shuffle();

    return Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: description == optionSelected
                        ? optionSelected == correctAnswer
                            ? Colors.green.withOpacity(0.7)
                            : Colors.red.withOpacity(0.7)
                        : Colors.grey),
              ),
              child: Text(option, style: TextStyle(
                color: optionSelected == description
                    ? optionSelected == correctAnswer
                    ? Colors.green.withOpacity(0.7)
                    : Colors.red.withOpacity(0.7)
                    : Colors.grey,
              ),),
            ),
            const SizedBox(width: 8,),
            Text(description)
          ],
        )
    );
  }
}
