// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      extendBodyBehindAppBar: true,
      appBar: SharedAppBar(
        leading: leadingBack(context),
        title: "",
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
      body: Column(
        children: [
          Container(
            height: 200.0,
            width: double.maxFinite,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/quizbg.jpg'),
                    fit: BoxFit.cover)),
            child: const Row(
              children: [
                SizedBox(
                  width: 24,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("All Quizzes",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        )),
                    Text("Description",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        )),
                    SizedBox(
                      height: 12,
                    )
                  ],
                ),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 400,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
              Positioned.fill(
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
                              colorNotes:
                                  NoteColors().noteColorsList[index % 15]);
                        });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
