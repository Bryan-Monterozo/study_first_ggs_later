// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:study_first_ggs_later/modules/quiz/controller/quiz_get_controller.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
import 'package:study_first_ggs_later/modules/quiz/view/widgets/option_tilesv2.dart';

class QuestionTilesWidget extends StatefulWidget {
  final OptionModel optionModel;
  final int questionNumber;
  final int currentQuestion;

  const QuestionTilesWidget({
    Key? key,
    required this.optionModel,
    required this.questionNumber,
    required this.currentQuestion,
  }) : super(key: key);

  @override
  State<QuestionTilesWidget> createState() => _QuestionTilesWidgetState();
}

class _QuestionTilesWidgetState extends State<QuestionTilesWidget> {
  String optionSelected = '';
  OptionModel optionModel = OptionModel();
  // final optionsController = Get.create(() => OptionsController());

  @override
  Widget build(BuildContext context) {
    // final optionsController = Get.find<OptionsController>();
    final OptionsController optionsController = Get.put(OptionsController());
    // debugPrint('Widget Rebuild');
    return Column(children: [
      Align(
        alignment: const Alignment(0.0, -5.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.3,
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF0B6BA7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Align(
                alignment: const AlignmentDirectional(0.00, 0.00),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Question ${widget.currentQuestion}/${widget.questionNumber} ',
                      style:
                          const TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      widget.optionModel.question!,
                      style: const TextStyle(fontFamily: 'Poppins', fontSize: 14, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
          ),
        ),
      ),
      // const SizedBox(
      //   height: 10,
      // ),
      Column(
        children: [
          GestureDetector(
            onTap: () {
              optionsController.currentQuestionAnswered();
              if (widget.optionModel.answered == false) {
                if (widget.optionModel.option1 ==
                    widget.optionModel.correctOption) {
                  optionSelected = widget.optionModel.option1!;
                  widget.optionModel.answered = true;
                  optionsController.addPoints();
                  setState(() {});
                } else {
                  optionSelected = widget.optionModel.option1!;
                  widget.optionModel.answered = true;
                  setState(() {});
                }
              }
            },
            child: OptionsTilesWidget(
              option: 'A',
              description: widget.optionModel.option1!,
              correctOption: widget.optionModel.correctOption!,
              optionSelected: optionSelected,
            ),
          ),
          GestureDetector(
            onTap: () {
              optionsController.currentQuestionAnswered();
              if (widget.optionModel.answered == false) {
                if (widget.optionModel.option2 ==
                    widget.optionModel.correctOption) {
                  optionSelected = widget.optionModel.option2!;
                  optionsController.addPoints();
                  widget.optionModel.answered = true;
                  setState(() {});
                } else {
                  optionSelected = widget.optionModel.option2!;
                  widget.optionModel.answered = true;
                  setState(() {});
                }
              }
            },
            child: OptionsTilesWidget(
              option: 'B',
              description: widget.optionModel.option2!,
              correctOption: widget.optionModel.correctOption!,
              optionSelected: optionSelected,
            ),
          ),
          GestureDetector(
            onTap: () {
              optionsController.currentQuestionAnswered();
              if (widget.optionModel.answered == false) {
                if (widget.optionModel.option3 ==
                    widget.optionModel.correctOption) {
                  optionSelected = widget.optionModel.option3!;
                  optionsController.addPoints();
                  widget.optionModel.answered = true;
                  setState(() {});
                } else {
                  optionSelected = widget.optionModel.option3!;
                  widget.optionModel.answered = true;
                  setState(() {});
                }
              }
            },
            child: OptionsTilesWidget(
              option: 'C',
              description: widget.optionModel.option3!,
              correctOption: widget.optionModel.correctOption!,
              optionSelected: optionSelected,
            ),
          ),
          GestureDetector(
            onTap: () {
              optionsController.currentQuestionAnswered();
              if (widget.optionModel.answered == false) {
                if (widget.optionModel.option4 ==
                    widget.optionModel.correctOption) {
                  optionSelected = widget.optionModel.option4!;
                  optionsController.addPoints();
                  widget.optionModel.answered = true;
                  setState(() {});
                } else {
                  optionSelected = widget.optionModel.option4!;
                  widget.optionModel.answered = true;
                  setState(() {});
                }
              }
            },
            child: OptionsTilesWidget(
              option: 'D',
              description: widget.optionModel.option4!,
              correctOption: widget.optionModel.correctOption!,
              optionSelected: optionSelected,
            ),
          ),
          GetBuilder<OptionsController>(
            id: 'nextQuestionButton',
            builder: (controller) => Visibility(
              visible: controller.answeredCurrent == true ? true : false,
              child: GestureDetector(
                onTap: () {
                  controller.nextQuestion();
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(top: 12),
                  width: 200.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFF57BA5E),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Text(
                      'Next',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    ]);
  }
}
