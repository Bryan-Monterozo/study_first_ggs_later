// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:study_first_ggs_later/modules/reviewer/models/fc_model.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_flash_card/reviewer_fc_show_deck.dart';

class DeckTileWidget extends StatelessWidget {

  
  final DeckModel deckModel;
  final Color colorNotes;


  const DeckTileWidget({
    Key? key,
    required this.deckModel,
    required this.colorNotes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewerFcShowDeck(deckModel: deckModel)));
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
                deckModel.deckName,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              Text(deckModel.deckDesc),
            ],
        ),
      ),
    ));
  }
}
