import 'package:flutter/material.dart';
// import 'package:study_first_ggs_later/modules/quiz/view/screens/quiz_add_question.dart';
import 'package:study_first_ggs_later/modules/quiz/view/screens/quiz_create.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class QuizCatalogue extends StatelessWidget {
  const QuizCatalogue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        leading: leadingBack(context),
        titlePic: titlePic(context),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => QuizCreate()));
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
