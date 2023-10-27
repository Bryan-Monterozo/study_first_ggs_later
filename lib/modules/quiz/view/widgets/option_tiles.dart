// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OptionsTilesWidget extends StatelessWidget {
  final String option, description, correctOption, optionSelected;
  // final QuestionModel questionModel;
  // final QuizModel quizModel;
  // final questionId;

  const OptionsTilesWidget({
    Key? key,
    required this.option,
    required this.description,
    required this.correctOption,
    required this.optionSelected,
    // required this.questionModel,
    // required this.quizModel,
    // required this.questionId,
  }) : super(key: key);

  // final optionsController = Get.create(() => OptionsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: optionSelected == description
                  ? Colors.blue
                  : Colors.transparent,
            border: Border.all(
              width: 2,
              color: optionSelected == description
                  ? Colors.white
                  : Colors.black,
            )),
        padding: const EdgeInsets.all(5.0),
        // color: optionSelected == description ? Colors.blue : Colors.transparent,
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 28,
              height: 28,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: optionSelected == description
                    ? Colors.blue
                    : Colors.transparent,
                border: Border.all(
                    width: 2,
                    color: optionSelected == description
                        ? Colors.white
                        : Colors.black),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                option,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: optionSelected == description
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(description,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: optionSelected == description
                        ? Colors.white
                        : Colors.black)),
          ],
        ),
      ),
    );
  }
}
