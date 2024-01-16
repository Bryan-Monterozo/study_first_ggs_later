import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/core/constants/reviwer_notes_colors.dart';
import 'package:study_first_ggs_later/modules/reviewer/models/fc_model.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_flash_card/reviewer_fc_show_deck.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_flash_card/reviewer_fc_shuffle_card.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/widgets/flash_card_buttons.dart';
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
    final uid = FirebaseAuth.instance.currentUser!.uid;
    debugPrint('deckModel: rundeck}');
    final ref = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Decks')
        .doc(deckModel!.deckId)
        .collection('cards');
    return Scaffold(
      appBar: SharedAppBar(
        leading: leadingBack(context),
        title: 'My Cards',
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: StreamBuilder<QuerySnapshot>(
            stream: ref.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Swiper(
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
                              colorNotes: NoteColors().noteColorsList[index]);
                    },
                    itemCount: snapshot.data!.docs.length,
                    // ReviewerFcDB()
                    //     .getCardCount(deckId: deckModel!.deckId),
                    itemWidth: 300.0,
                    itemHeight: 350.0,
                    layout: SwiperLayout.TINDER,
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlashCardButtonGesture(
                          flashCardButtonNavigator: ReviewerFcShowDeck(
                            deckModel: deckModel!,
                          ),
                          flashCardButtonContainer: const FlashCardButtonWidget(
                            flashCardButtonText: 'View Cards',
                            flashCardButtonColor: Color(0xFF0B6BA7),
                            flashCardButtonIcon: Icons.view_list_rounded,
                          )),
                      FlashCardButtonGesture(
                          flashCardButtonNavigator: ReviewerFcShuffleCard(
                            deckModel: deckModel!,
                          ),
                          flashCardButtonContainer: const FlashCardButtonWidget(
                            flashCardButtonText: 'Play!',
                            flashCardButtonColor: Color(0xFF57BA5E),
                            flashCardButtonIcon: Icons.shuffle_on_rounded,
                          )),
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }

  // randomizeCard() {
  //   final randomCard = Random()
  //       .nextInt(ReviewerFcDB().getCardCount(deckId: deckModel!.deckId));

  //   return randomCard;
  // }
}
