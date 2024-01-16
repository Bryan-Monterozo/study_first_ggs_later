// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

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
              Get.back();
            },
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              ReviewerFcDB().editCardFromDeck(
                cardFront: cardFront.text,
                cardBack: cardBack.text,
                deckId: widget.deckId,
                cardId: widget.cardModel.cardId,
              );
              Navigator.of(context)..pop()..pop();
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
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
              decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 2, color: const Color(0xFFcecece))),
              child: TextField(
                maxLength: 60,
                controller: cardFront,
                decoration: const InputDecoration(hintText: 'Input a Question'),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
              decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 2, color: const Color(0xFFcecece))),
              child: TextField(
                maxLength: 200,
                controller: cardBack,
                decoration: const InputDecoration(hintText: 'Input an Answer'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
