// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
import 'package:study_first_ggs_later/modules/quiz/view/widgets/quiz_dialog.dart';

class QuizTileWidget extends StatelessWidget {
  final QuizModel quizModel;
  // final QuestionModel questionModel;
  final Color colorNotes;

  const QuizTileWidget({
    Key? key,
    required this.quizModel,
    // required this.questionModel,
    required this.colorNotes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(3.0),
        child: GestureDetector(
          onTap: () {
            //  TODO: Navigate to quiz
            debugPrint('QuizTileWidget: ${quizModel.quizId}');
            // Get.to(QuizPlay(
            //   quizModel: quizModel,
            //   quizId: quizModel.quizId,
            // ));
            Get.dialog(
              QuizDialogWidget(quizModel: quizModel),
              barrierDismissible: true,
              barrierColor: Colors.black.withOpacity(0.5),
            );
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
                  quizModel.quizTitle,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                Text(quizModel.quizDesc),
              ],
            ),
          ),
        ));
  }
}
