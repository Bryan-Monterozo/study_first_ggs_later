// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:study_first_ggs_later/modules/reviewer/models/fc_model.dart';
import 'package:study_first_ggs_later/modules/reviewer/services/reviewer_fc_collection.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class ReviewerFcAddCard extends StatefulWidget {
  final deckId;
  final DeckModel? deckModel;

  const ReviewerFcAddCard({
    Key? key,
    required this.deckId,
    required this.deckModel,
  }) : super(key: key);

  @override
  State<ReviewerFcAddCard> createState() => _ReviewerFcAddCardState();
}

class _ReviewerFcAddCardState extends State<ReviewerFcAddCard> {
  String cardFront = '';
  String cardBack = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        leading: leadingBack(context),
        title: 'Create a Deck',
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              ReviewerFcDB().addCardToDeck(
                cardFront: cardFront,
                cardBack: cardBack,
                deckId: widget.deckId,
              );
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                maxLength: 60,
                onChanged: (value) {
                  cardFront = value;
                },
                decoration: const InputDecoration(hintText: 'Input a Question'),
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                maxLength: 200,
                onChanged: (value) {
                  cardBack = value;
                },
                decoration: const InputDecoration(hintText: 'Input an Answer'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
