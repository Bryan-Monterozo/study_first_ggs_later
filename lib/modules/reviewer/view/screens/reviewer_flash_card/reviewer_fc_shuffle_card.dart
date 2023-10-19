// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/core/constants/reviwer_notes_colors.dart';
import 'package:study_first_ggs_later/modules/reviewer/models/fc_model.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/widgets/flash_card_buttons.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/widgets/flash_card_shuffle.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class ReviewerFcShuffleCard extends StatelessWidget {
  static const String routeName = '/reviewer/reviewer_fc_shuffle_card';
  final DeckModel? deckModel;
  final CardModel? cardModel;

  const ReviewerFcShuffleCard({
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
          // IconButton(
          //   onPressed: () {
          //     // Navigator.pushReplacement(
          //     //     context,
          //     //     MaterialPageRoute(
          //     //         builder: (context) => ReviewerFcEditCard(
          //     //               deckId: deckModel!.deckId,
          //     //               cardModel: cardModel!,
          //     //               deckModel: deckModel!,
          //     //             )));
          //   },
          //   icon: const Icon(Icons.edit),
          // ),
          // IconButton(
          //   onPressed: () {
          //     // ReviewerFcDB().deleteCardFromDeck(
          //     //     deckId: cardModel!.deckId, cardId: cardModel!.cardId);
          //     // Navigator.pop(context);
          //   },
          //   icon: const Icon(Icons.delete),
          // ),
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

                final random = (snapshot.data! as QuerySnapshot).docs.toList()
                  ..shuffle();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          // .shuffle();

                          // final fcDataMap = snapshot.data!.docs..shuffle();
                          final fcDataMap = random[index];
                          CardModel cardModel = CardModel.fromMap(
                              fcDataMap.data() as Map<String, dynamic>);
                          return snapshot.data!.docs.isEmpty
                              ? const Center(child: Text('No Cards'))
                              : ReviewerFcShuffleWidget(
                                  // deckModel: deckModel!,
                                  // colorNotes: NoteColors.noteColor[index],
                                  cardModel: cardModel,
                                  colorNotes:
                                      NoteColors().noteColorsList[index]);
                        },
                        itemCount: snapshot.data!.docs.length,
                        // ReviewerFcDB()
                        //     .getCardCount(deckId: deckModel!.deckId),
                        itemWidth: 300.0,
                        itemHeight: 350.0,
                        layout: SwiperLayout.TINDER,
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: 400,
                        height: 50,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FlashCardButtonGesture(
                                flashCardButtonContainer: FlashCardButtonWidget(
                              flashCardButtonText: 'Quit',
                              flashCardButtonColor: Colors.redAccent,
                              flashCardButtonIcon: Icons.exit_to_app_rounded,
                            )),
                          ],
                        ),
                      ),
                    ),
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
