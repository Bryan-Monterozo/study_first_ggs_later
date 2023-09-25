import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';

class StudyQuiz extends StatelessWidget {
  const StudyQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: const Center(
        child: Text('Quiz'),
      ),
      drawer: const NavDrawer(),
    );
  }
}