// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:study_first_ggs_later/modules/reviewer/models/fc_model.dart';
import 'package:study_first_ggs_later/modules/reviewer/services/reviewer_fc_collection.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_fc_edit_card.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class ReviewerFcShowCard extends StatefulWidget {
  final CardModel? cardModel;
  final DeckModel? deckModel;

  const ReviewerFcShowCard({
    Key? key,
    required this.cardModel,
    required this.deckModel,
  }) : super(key: key);

  @override
  State<ReviewerFcShowCard> createState() => _ReviewerFcShowCardState();
}

class _ReviewerFcShowCardState extends State<ReviewerFcShowCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        leading: leadingBack(context),
        titlePic: titlePic(context),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReviewerFcEditCard(
                            deckId: widget.deckModel!.deckId,
                            cardModel: widget.cardModel!,
                            deckModel: widget.deckModel!,
                          )));
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              ReviewerFcDB().deleteCardFromDeck(
                  deckId: widget.cardModel!.deckId,
                  cardId: widget.cardModel!.cardId);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          decoration: const BoxDecoration(color: Colors.white),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // MediaQuery.removePadding(
            //   context: context,
            //   removeBottom: true,
            //   child: AppBar(
            //     elevation: 0.0,
            //     backgroundColor: Colors.white54,
            //   ),
            // ),
            Expanded(
              flex: 4,
              child: Card(
                elevation: 0.0,
                margin: const EdgeInsets.only(
                    left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),
                color: Colors.white,
                child: FlipCard(
                  direction: FlipDirection.HORIZONTAL,
                  side: CardSide.FRONT,
                  speed: 500,
                  front: Container(
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(0.0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.cardModel!.cardFront,
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  back: Container(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(0.0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.cardModel!.cardBack,
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            )
          ],
        ),
      ]),
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