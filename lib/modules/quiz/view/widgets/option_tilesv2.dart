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
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 12),
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: optionSelected == description
          ? BoxDecoration(
              color: const Color(0xFF0B6BA7),
              borderRadius: BorderRadius.circular(12),
              // border: Border.all(width: 2, color: Colors.green)
            )
          : BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
            ),
      child: Align(
        alignment: const AlignmentDirectional(0.00, 0.00),
        child: Text(
          description,
          style: optionSelected == description
              ? const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)
              : const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
