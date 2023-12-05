import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/reviewer/models/fc_model.dart';
import 'package:study_first_ggs_later/modules/reviewer/services/reviewer_fc_collection.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_flash_card/reviewer_fc_edit_card.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/widgets/flash_card.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class ReviewerFcShowCard extends StatelessWidget {
  static const String routeName = '/reviewer/reviewer_fc_show_card';
  final CardModel? cardModel;
  final DeckModel? deckModel;

  const ReviewerFcShowCard({
    Key? key,
    required this.cardModel,
    required this.deckModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        leading: leadingBack(context),
        title: '',
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReviewerFcEditCard(
                            deckId: deckModel!.deckId,
                            cardModel: cardModel!,
                            deckModel: deckModel!,
                          )));
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              ReviewerFcDB().deleteCardFromDeck(
                  deckId: cardModel!.deckId, cardId: cardModel!.cardId);
              Navigator.pop(context);
            },
            padding: const EdgeInsets.only(right: 12),
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ReviewerFlashCardWidget(
              cardModel: cardModel,
            ),
            const SizedBox(
              height: 48,
            ),
          ],
        ),
      ),
    );
  }
}

// child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 FlipCard(
//                   fill: Fill.fillBack,
//                   direction: FlipDirection.HORIZONTAL,
//                   side: CardSide.FRONT,
//                   speed: 500,
//                   front: Container(
//                     decoration: const BoxDecoration(color: Colors.red),
//                     child: Text("Front"),
//                   ),
//                   back: Container(
//                     decoration: const BoxDecoration(color: Colors.blue),
//                     child: Text("Back"),
//                   ),
//                 )
//               ]),


