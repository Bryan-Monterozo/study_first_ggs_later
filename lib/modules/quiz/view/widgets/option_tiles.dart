// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/quiz/controller/quiz_get_controller.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';

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
      padding: const EdgeInsets.all(3.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: optionSelected == description
                      ? optionSelected == correctOption
                          ? Colors.green.withOpacity(0.7)
                          : Colors.red.withOpacity(0.7)
                      : Colors.grey),
            ),
            child: Text(
              option,
              style: TextStyle(
                color: optionSelected == description
                    ? optionSelected == correctOption
                        ? Colors.green.withOpacity(0.7)
                        : Colors.red.withOpacity(0.7)
                    : Colors.grey,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(description)
        ],
      ),
    );
  }
}
