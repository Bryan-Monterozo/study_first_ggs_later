// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/core/constants/reviwer_notes_colors.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
import 'package:study_first_ggs_later/modules/quiz/view/widgets/questions_tiles_single.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class QuizShowQuestions extends StatelessWidget {
  final QuizModel? quizModel;
  final noteColors = NoteColors().noteColorsList;
  QuizShowQuestions({
    Key? key,
    required this.quizModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseFirestore.instance
        .collection('Quiz')
        .doc(quizModel!.quizId)
        .collection('questions');
    return Scaffold(
      appBar: SharedAppBar(
        leading: leadingBack(context),
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: ref.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final quizDataMap = snapshot.data!.docs[index];
                  QuestionModel questionModel = QuestionModel.fromMap(
                      quizDataMap.data() as Map<String, dynamic>);
                  return snapshot.data!.docs.isEmpty
                      ? const Center(child: Text('No Questions'))
                      : QuestionTileSingleWidget(
                          quizModel: quizModel!,
                          questionModel: questionModel,
                          colorNotes: NoteColors().noteColorsList[index % 15]);
                });
          },
        ),
      ),
    );
  }
}
