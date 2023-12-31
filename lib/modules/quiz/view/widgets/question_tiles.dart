// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/quiz/controller/quiz_get_controller.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
import 'package:study_first_ggs_later/modules/quiz/view/widgets/option_tiles.dart';

class QuestionTilesWidget extends StatefulWidget {
  final OptionModel optionModel;

  const QuestionTilesWidget({
    Key? key,
    required this.optionModel,
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
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.optionModel.question!,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    )),
                child: Stack(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
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
                        const SizedBox(
                          height: 4,
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
                        const SizedBox(
                          height: 4,
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
                        const SizedBox(
                          height: 4,
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
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
