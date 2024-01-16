// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:study_first_ggs_later/core/constants/reviwer_notes_colors.dart';
import 'package:study_first_ggs_later/modules/reviewer/models/fc_model.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_flash_card/reviewer_fc_add_card.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_flash_card/reviewer_fc_shuffle_card.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/widgets/card_tiles.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class ReviewerFcShowDeck extends StatelessWidget {
  static const String routeName = '/reviewer/:reviewer_fc_show_deck';
  final DeckModel? deckModel;
  final noteColors = NoteColors().noteColorsList;

  ReviewerFcShowDeck({
    Key? key,
    required this.deckModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      appBar: SharedAppBar(
        leading: leadingBack(context),
        title: 'View Cards',
        actions: [
          // IconButton(
          //   onPressed: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => ReviewerFcAddCard(
          //                   deckId: deckModel!.deckId,
          //                   deckModel: deckModel,
          //                 )));
          //   },
          //   icon: const Icon(Icons.add_circle_outline),
          // ),
          IconButton(
            onPressed: () {
              Get.to(ReviewerFcAddCard(
                            deckId: deckModel!.deckId,
                            deckModel: deckModel,
                          ));
            },
            icon: const Icon(Icons.add_circle_outline),
          ),
          IconButton(
            padding: const EdgeInsets.only(right: 12),
            onPressed: () {
              Get.to(ReviewerFcShuffleCard(
                            // deckId: deckModel!.deckId,
                            deckModel: deckModel,
                          ));
            },
            icon: const Icon(Icons.shuffle),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: const Color(0xFF0B6BA7),
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ReviewerFcAddCard(
                          deckId: deckModel!.deckId,
                          deckModel: deckModel,
                        )));
          }),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: firestore
                    .collection('Users')
                    .doc(uid)
                    .collection('Decks')
                    .doc(deckModel!.deckId)
                    .collection('cards')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return MasonryGridView.builder(
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final fcDataMap = snapshot.data!.docs[index];
                        CardModel cardModel = CardModel.fromMap(
                            fcDataMap.data() as Map<String, dynamic>);
                        return snapshot.data!.docs.isEmpty
                            ? const Center(child: Text('No Cards'))
                            : CardTileWidget(
                                deckModel: deckModel!,
                                cardModel: cardModel,
                                colorNotes:
                                    NoteColors().noteColorsList[index % 15],
                              );
                      });
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
