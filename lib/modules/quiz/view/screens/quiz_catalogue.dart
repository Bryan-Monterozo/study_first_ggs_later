// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:study_first_ggs_later/core/constants/reviwer_notes_colors.dart';
import 'package:study_first_ggs_later/modules/quiz/model/quiz_model.dart';
import 'package:study_first_ggs_later/modules/quiz/view/screens/quiz_create.dart';
import 'package:study_first_ggs_later/modules/quiz/view/widgets/quiz_tiles.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class QuizCatalogue extends StatelessWidget {
  final QuizModel? quizModel;
  const QuizCatalogue({
    Key? key,
    this.quizModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseFirestore.instance.collection('Quiz');

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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const QuizCreate()));
            },
            icon: const Icon(Icons.add),
          ),
        ],
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
                  QuizModel quizModel = QuizModel.fromMap(
                      quizDataMap.data() as Map<String, dynamic>);
                  return QuizTileWidget(
                      quizModel: quizModel,
                      
                      colorNotes: NoteColors().noteColorsList[index % 15]);
                });
          },
        ),
      ),
    );
  }
}
