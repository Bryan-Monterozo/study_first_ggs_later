// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
import 'package:study_first_ggs_later/modules/quiz/services/quiz_catalogue_collection.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class QuizEditQuestion extends StatefulWidget {
  final QuizModel quizModel;
  final QuestionModel questionModel;

  const QuizEditQuestion({
    Key? key,
    required this.quizModel,
    required this.questionModel,
  }) : super(key: key);

  @override
  State<QuizEditQuestion> createState() => _QuizEditQuestionState();
}

class _QuizEditQuestionState extends State<QuizEditQuestion> {
  TextEditingController question = TextEditingController();
  TextEditingController option1 = TextEditingController();
  TextEditingController option2 = TextEditingController();
  TextEditingController option3 = TextEditingController();
  TextEditingController option4 = TextEditingController();
  QuizCatDB quizCatDB = QuizCatDB();

  @override
  void initState() {
    question = TextEditingController(text: widget.questionModel.question);
    option1 = TextEditingController(text: widget.questionModel.option1);
    option2 = TextEditingController(text: widget.questionModel.option2);
    option3 = TextEditingController(text: widget.questionModel.option3);
    option4 = TextEditingController(text: widget.questionModel.option4);

    super.initState();
  }

  @override
  void dispose() {
    question.dispose();
    option1.dispose();
    option2.dispose();
    option3.dispose();
    option4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        leading: leadingBack(context),
        title: 'Edit Question',
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Get.back();
            },
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              quizCatDB.editQuestionFromQuiz(
                quizId: widget.quizModel.quizId,
                questionId: widget.questionModel.questionId,
                question: question.text,
                option1: option1.text,
                option2: option2.text,
                option3: option3.text,
                option4: option4.text
              );
              Get.back();
            },
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 2, color: const Color(0xFFcecece))),
              child: TextFormField(
                maxLength: 60,
                controller: question,
                decoration: const InputDecoration(hintText: 'Input a Question'),
              ),
            ),
            Container(
              padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 2, color: const Color(0xFFcecece))),
              child: TextFormField(
                maxLength: 60,
                controller: option1,
                decoration: const InputDecoration(hintText: 'Option 1'),
              ),
            ),
            Container(
              padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 2, color: const Color(0xFFcecece))),
              child: TextFormField(
                maxLength: 60,
                controller: option2,
                decoration: const InputDecoration(hintText: 'Option 2'),
              ),
            ),
            Container(
              padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 2, color: const Color(0xFFcecece))),
              child: TextFormField(
                maxLength: 60,
                controller: option3,
                decoration: const InputDecoration(hintText: 'Option 3'),
              ),
            ),
            Container(
              padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 2, color: const Color(0xFFcecece))),
              child: TextFormField(
                maxLength: 60,
                controller: option4,
                decoration: const InputDecoration(hintText: 'Option 4'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
