import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_first_ggs_later/modules/reviewer/models/note_model.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/widgets/note_tiles.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/widgets/search_bar.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_notes/reviewer_notes_add.dart';
import 'package:study_first_ggs_later/core/constants/reviwer_notes_colors.dart';


class ReviewerNotes extends StatelessWidget {
  ReviewerNotes({super.key});
  static const String routeName = '/reviewer/mynotes';
  final ref = FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid).collection('Notes');

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: SharedAppBar(
          leading: leadingBack(context),
          titlePic: titlePic(context),
          withPic: withPic(context),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ReviewerAddNote()));
          },
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  searchBox(),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                        stream: ref.snapshots(),
                        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          }
                          return GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 300,
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 24,
                                      mainAxisSpacing: 24),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                final noteDataMap = snapshot.data!.docs[index];
                                NoteModel noteModel = NoteModel.fromMap(
                                    noteDataMap.data() as Map<String, dynamic>);
                                return NoteTileWidget(
                                    noteModel: noteModel,
                                    colorNotes:
                                        NoteColors().noteColorsList[index % 15]);
                              });
                        }),
                  ),
                ],
              )),
        ));
  }
}
