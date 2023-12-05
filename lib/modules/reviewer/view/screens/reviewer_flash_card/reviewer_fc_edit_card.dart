// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:study_first_ggs_later/modules/reviewer/models/fc_model.dart';
import 'package:study_first_ggs_later/modules/reviewer/services/reviewer_fc_collection.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class ReviewerFcEditCard extends StatefulWidget {
  static const String routeName = '/reviewer/reviewer_fc_edit_card';
  final deckId;
  final CardModel cardModel;
  final DeckModel deckModel;

  const ReviewerFcEditCard({
    Key? key,
    required this.deckId,
    required this.cardModel,
    required this.deckModel,
  }) : super(key: key);

  @override
  State<ReviewerFcEditCard> createState() => _ReviewerFcEditCardState();
}

class _ReviewerFcEditCardState extends State<ReviewerFcEditCard> {
  TextEditingController cardFront = TextEditingController();
  TextEditingController cardBack = TextEditingController();

  @override
  void initState() {
    super.initState();

    CardModel cardModel = widget.cardModel;

    cardFront = TextEditingController(text: cardModel.cardFront);
    cardBack = TextEditingController(text: cardModel.cardBack);
  }

  @override
  void dispose() {
    cardFront.dispose();
    cardBack.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        leading: leadingBack(context),
        title: 'Edit Card',
        actions: [
          TextButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
            padding: const EdgeInsets.only(right: 12),
            icon: const Icon(Icons.save),
            onPressed: () {
              ReviewerFcDB().editCardFromDeck(
                cardFront: cardFront.text,
                cardBack: cardBack.text,
                deckId: widget.deckId,
                cardId: widget.cardModel.cardId,
              );
              Navigator.of(context)
                ..pop()
                ..pop();
              // Navigator.po(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => ReviewerFcShowCard(
              //               deckModel: widget.deckModel,
              //               cardModel: widget.cardModel,
              //             )));

              // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ReviewerFcShowDeck(deckModel: widget.deckModel)), (route) => false);
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          children: [
            TextField(
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
              maxLength: 60,
              maxLines: 2,
              controller: cardFront,
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterStyle: TextStyle(
                  height: double.minPositive,
                ),
                counterText: "",
                hintText: 'Input a Question',
                labelStyle: TextStyle(
                  color: Color(0xffcecece),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
                labelText: 'Question',
              ),
            ),
            TextField(
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
              maxLength: 200,
              maxLines: 10,
              controller: cardBack,
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterStyle: TextStyle(
                  height: double.minPositive,
                ),
                counterText: "",
                hintText: 'Input an Answer',
                labelStyle: TextStyle(
                  color: Color(0xffcecece),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
                labelText: 'Answer',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
