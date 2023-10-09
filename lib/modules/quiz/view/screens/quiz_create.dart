import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/quiz/services/quiz_catalogue_collection.dart';

class QuizCreate extends StatefulWidget {
  const QuizCreate({super.key});

  @override
  State<QuizCreate> createState() => _QuizCreateState();
}

class _QuizCreateState extends State<QuizCreate> {

  String quizTitle = '';
  String quizDesc = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        leading: leadingBack(context),
        title: 'Create a Deck',
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
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              QuizCatDB().addQuizToDB(
                quizTitle: quizTitle, 
                quizDesc: quizDesc,);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                maxLength: 60,
                onChanged: (value) {
                  quizTitle = value;
                },
                decoration: const InputDecoration(hintText: 'Deck Name'),
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                maxLength: 60,
                onChanged: (value) {
                  quizDesc = value;
                },
                decoration: const InputDecoration(hintText: 'Description'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}