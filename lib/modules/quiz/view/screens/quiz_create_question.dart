// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class QuizCreateQuestion extends StatefulWidget {
  final quizId;
  final QuestionModel? questionModel;

  const QuizCreateQuestion({
    Key? key,
    this.questionModel,
    this.quizId,
  }) : super(key: key);

  @override
  State<QuizCreateQuestion> createState() => _QuizCreateQuestionState();
}

class _QuizCreateQuestionState extends State<QuizCreateQuestion> {
  String question = '';
  String option1 = '';
  String option2 = '';
  String option3 = '';
  String option4 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            
            Navigator.pop(context);
          },
        ),
        title: 'Create a Question',
        withPic: withPic(context),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextFormField(
                validator: (value) =>
                    value!.isEmpty ? 'Enter a question' : null,
                onChanged: (value) {
                  question = value;
                },
                decoration: const InputDecoration(hintText: 'Question'),
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextFormField(
                validator: (value) =>
                    value!.isEmpty ? 'Enter the Correct Answer' : null,
                onChanged: (value) {
                  option1 = value;
                },
                decoration: const InputDecoration(
                    hintText: 'Option 1 (Correct Answer)'),
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextFormField(
                validator: (value) => value!.isEmpty ? 'Enter an Option' : null,
                onChanged: (value) {
                  option2 = value;
                },
                decoration: const InputDecoration(hintText: 'Option 2'),
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextFormField(
                validator: (value) => value!.isEmpty ? 'Enter an Option' : null,
                onChanged: (value) {
                  option3 = value;
                },
                decoration: const InputDecoration(hintText: 'Option 3'),
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextFormField(
                validator: (value) => value!.isEmpty ? 'Enter an Option' : null,
                onChanged: (value) {
                  option4 = value;
                },
                decoration: const InputDecoration(hintText: 'Option 4'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
