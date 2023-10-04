import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/reviewer/models/fc_model.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_fc_show_card.dart';

class CardTileWidget extends StatelessWidget {

  final DeckModel deckModel;
  final CardModel cardModel;
  final Color colorNotes;


  const CardTileWidget({
    Key? key,
    required this.cardModel,
    required this.colorNotes,
    required this.deckModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ReviewerFcShowCard(cardModel: cardModel, deckModel: deckModel,),));
        },
        child: Container(
          decoration: BoxDecoration(
              color: colorNotes,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cardModel.cardFront,
                style: const TextStyle(fontSize: 30, color: Colors.black),
              ),
            ],
        ),
      ),
    ));
  }
}
