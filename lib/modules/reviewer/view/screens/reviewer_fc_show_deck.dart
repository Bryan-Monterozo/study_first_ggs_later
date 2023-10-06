// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:study_first_ggs_later/core/constants/reviwer_notes_colors.dart';
import 'package:study_first_ggs_later/modules/reviewer/models/fc_model.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_fc_add_card.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_fc_shuffle_card.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/widgets/card_tiles.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class ReviewerFcShowDeck extends StatelessWidget {
  final DeckModel? deckModel;

  const ReviewerFcShowDeck({
    Key? key,
    required this.deckModel,
  }) : super(key: key);

  // final ref = FirebaseFirestore.instance
  //     .collection('Decks')
  //     .doc(deckId)
  //     .collection('Cards');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        leading: leadingBack(context),
        titlePic: titlePic(context),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReviewerFcAddCard(
                            deckId: deckModel!.deckId,
                            deckModel: deckModel,
                          )));
            },
            icon: const Icon(Icons.add_circle_outline),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReviewerFcShuffleCard(
                            // deckId: deckModel!.deckId,
                            deckModel: deckModel,
                          )));
            },
            icon: const Icon(Icons.shuffle),
          ),
        ],
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Decks')
              .doc(deckModel!.deckId)
              .collection('cards')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
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
                          colorNotes: NoteColors().noteColorsList[index]);
                });
          },
        ),
      ),
    );
  }
}
