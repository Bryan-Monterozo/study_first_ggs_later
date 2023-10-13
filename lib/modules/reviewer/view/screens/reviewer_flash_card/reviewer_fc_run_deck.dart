import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/core/constants/reviwer_notes_colors.dart';
import 'package:study_first_ggs_later/modules/reviewer/models/fc_model.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_flash_card/reviewer_fc_show_deck.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_flash_card/reviewer_fc_shuffle_card.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/widgets/flash_card_shuffle.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class ReviewerFcRunDeck extends StatelessWidget {
  final DeckModel? deckModel;
  final CardModel? cardModel;


  const ReviewerFcRunDeck({
    Key? key,
    this.deckModel,
    this.cardModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseFirestore.instance
        .collection('Decks')
        .doc(deckModel!.deckId)
        .collection('cards');
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
                      builder: (context) => ReviewerFcShowDeck(
                            // deckId: deckModel!.deckId,
                            // cardModel: cardModel!,
                            deckModel: deckModel!,
                          )));
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReviewerFcShuffleCard(
                            // deckId: deckModel!.deckId,
                            // cardModel: cardModel!,
                            deckModel: deckModel!,
                          )));
            },
            icon: const Icon(Icons.shuffle_rounded),
          ),
        ],
      ),
      body: Container(
        child: Stack(fit: StackFit.expand, children: <Widget>[
          Container(
            decoration: const BoxDecoration(color: Colors.white),
          ),
          StreamBuilder<QuerySnapshot>(
              stream: ref.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                // final random = (snapshot.data! as QuerySnapshot).docs.toList()
                //   ..shuffle();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          // .shuffle();

                          final fcDataMap = snapshot.data!.docs[index];
                          // final fcDataMap = random[index];
                          CardModel cardModel = CardModel.fromMap(
                              fcDataMap.data() as Map<String, dynamic>);
                          return snapshot.data!.docs.isEmpty
                              ? const Center(child: Text('No Cards'))
                              : ReviewerFcShuffleWidget(
                                  // deckModel: deckModel!,
                                  // colorNotes: NoteColors.noteColor[index],
                                  cardModel: cardModel,
                                  colorNotes: NoteColors().noteColorsList[index]
                                );
                        },
                        itemCount: snapshot.data!.docs.length,
                        // ReviewerFcDB()
                        //     .getCardCount(deckId: deckModel!.deckId),
                        itemWidth: 300.0,
                        itemHeight: 350.0,
                        layout: SwiperLayout.TINDER,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    )
                  ],
                );
              }),
        ]),
      ),
    );
  }

  // randomizeCard() {
  //   final randomCard = Random()
  //       .nextInt(ReviewerFcDB().getCardCount(deckId: deckModel!.deckId));

  //   return randomCard;
  // }
}
