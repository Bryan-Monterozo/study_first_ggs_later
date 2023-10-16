// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:study_first_ggs_later/modules/reviewer/models/fc_model.dart';
import 'package:study_first_ggs_later/modules/reviewer/services/reviewer_fc_collection.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_flash_card/reviewer_fc_run_deck.dart';
// import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_flash_card/reviewer_fc_show_deck.dart';

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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ReviewerFcRunDeck(deckModel: deckModel)));
          },
          onLongPress: () async {

            final result = await showMenu(
              context: context,
              position: const RelativeRect.fromLTRB(100, 100, 100, 100),
              items: [
                const PopupMenuItem(
                  value: 'delete',
                  child: Text('Delete', style: TextStyle(color: Colors.red)),
                ),
              ]
            );

              switch (result) {
                case 'delete':
                  ReviewerFcDB().deleteDeckFromDB(deckId: deckModel.deckId, cardId: deckModel.deckId);
                  break;
              }
          },
          child: Container(
            decoration: BoxDecoration(
                color: colorNotes,
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  deckModel.deckName,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(deckModel.deckDesc,
                style: const TextStyle(fontSize: 14 , color: Colors.white),
                ),
              ],
            ),
          ),
        ));
  }
}
