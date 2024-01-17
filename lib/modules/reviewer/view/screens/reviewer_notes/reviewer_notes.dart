import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/reviewer/models/note_model.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/widgets/note_tiles.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/widgets/search_bar.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_notes/reviewer_notes_add.dart';
import 'package:study_first_ggs_later/core/constants/reviwer_notes_colors.dart';
import 'package:study_first_ggs_later/modules/shared/controller/loading_controller.dart';
import 'package:study_first_ggs_later/modules/shared/widgets/loading_screen.dart';

class ReviewerNotes extends StatelessWidget {
  ReviewerNotes({super.key});
  static const String routeName = '/reviewer/mynotes';
  final ref = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Notes');
  final LoadingController loadingController = Get.put(LoadingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SharedAppBar(
          leading: leadingBack(context),
          title: 'Notes',
          withPic: withPic(context),
        ),
        floatingActionButton: FloatingActionButton(
            elevation: 0,
            backgroundColor: const Color(0xFF0B6BA7),
            foregroundColor: Colors.white,
            child: const Icon(Icons.add),
            onPressed: () {
              Get.to(const ReviewerAddNote());
            }),
        body: SafeArea(
          child: Stack(children: [
            Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    searchBox(),
                    Expanded(
                      child: StreamBuilder<QuerySnapshot>(
                          stream: ref.snapshots(),
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: LoadingAnimationTransparent());
                            }
                            return MasonryGridView.builder(
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                gridDelegate:
                                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  final noteDataMap =
                                      snapshot.data!.docs[index];
                                  NoteModel noteModel = NoteModel.fromMap(
                                      noteDataMap.data()
                                          as Map<String, dynamic>);
                                  return NoteTileWidget(
                                      noteModel: noteModel,
                                      colorNotes: NoteColors()
                                          .noteColorsList[index % 15]);
                                });
                          }),
                    ),
                  ],
                )),
            // Obx(() => loadingController.isLoading.value ? const LoadingAnimation() : Container()),
          ]),
        ));
  }
}
