// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
import 'package:study_first_ggs_later/modules/quiz/view/widgets/option_tiles.dart';

class QuestionTilesWidget extends StatelessWidget {
  final OptionModel optionModel;
  const QuestionTilesWidget({
    Key? key,
    required this.optionModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String optionSelected = '';
    //  List<String> optionsList = List<String>.from(optionsRef);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                optionModel.question!,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      OptionsTilesWidget(
                        option: 'A',
                        description: optionModel.option1!,
                        correctAnswer: optionModel.option1!,
                        optionSelected: optionSelected,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      OptionsTilesWidget(
                        option: 'B',
                        description: optionModel.option2!,
                        correctAnswer: optionModel.option1!,
                        optionSelected: optionSelected,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      OptionsTilesWidget(
                        option: 'C',
                        description: optionModel.option3!,
                        correctAnswer: optionModel.option1!,
                        optionSelected: optionSelected,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      OptionsTilesWidget(
                        option: 'D',
                        description: optionModel.option4!,
                        correctAnswer: optionModel.option1!,
                        optionSelected: optionSelected,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
