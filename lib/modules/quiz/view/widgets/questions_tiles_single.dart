// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
import 'package:study_first_ggs_later/modules/quiz/view/screens/quiz_edit_question.dart';

class QuestionTileSingleWidget extends StatelessWidget {
  final QuizModel quizModel;
  final QuestionModel questionModel;
  final Color colorNotes;

  const QuestionTileSingleWidget({
    Key? key,
    required this.quizModel,
    required this.questionModel,
    required this.colorNotes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(3.0),
        child: GestureDetector(
          onTap: () {
            Get.to(QuizEditQuestion(
              quizModel: quizModel,
              questionModel: questionModel,
            ));
          },
          onLongPress: () async {
            // final result = await showMenu(
            //     context: context,
            //     position: const RelativeRect.fromLTRB(100, 100, 100, 100),
            //     items: [
            //       const PopupMenuItem(
            //         value: 'delete',
            //         child: Text('Delete', style: TextStyle(color: Colors.red)),
            //       ),
            //     ]);

            // switch (result) {
            //   case 'delete':
            //     ReviewerFcDB().deleteDeckFromDB(
            //         deckId: deckModel.deckId, cardId: deckModel.deckId);
            //     break;
            // }
          },
          child: Container(
            decoration: BoxDecoration(
                color: colorNotes,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  questionModel.question,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                Text('${questionModel.option1} correct',
                    style: const TextStyle(fontSize: 16, color: Colors.black)),
                Text('${questionModel.option2} wrong',
                    style: const TextStyle(fontSize: 16, color: Colors.black)),
                Text('${questionModel.option3} wrong',
                    style: const TextStyle(fontSize: 16, color: Colors.black)),
                Text('${questionModel.option4} wrong',
                    style: const TextStyle(fontSize: 16, color: Colors.black)),
              ],
            ),
          ),
        ));
  }
}
