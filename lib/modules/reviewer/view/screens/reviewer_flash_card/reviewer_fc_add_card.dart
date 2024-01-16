// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:study_first_ggs_later/modules/reviewer/models/fc_model.dart';
import 'package:study_first_ggs_later/modules/reviewer/services/reviewer_fc_collection.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class ReviewerFcAddCard extends StatefulWidget {
  static const String routeName = '/reviewer/reviewer_fc_add_card';
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
        title: 'Create Card',
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
              Get.back();
            },
          ),
          IconButton(
            padding: const EdgeInsets.only(right: 12),
            icon: const Icon(Icons.save),
            onPressed: () {
              ReviewerFcDB().addCardToDeck(
                cardFront: cardFront,
                cardBack: cardBack,
                deckId: widget.deckId,
              );
              Get.back();
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              onChanged: (value) {
                cardFront = value;
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterStyle: TextStyle(
                  height: double.minPositive,
                ),
                counterText: "",
                hintText: 'Input a Question',
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
              onChanged: (value) {
                cardBack = value;
              },
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  counterStyle: TextStyle(
                    height: double.minPositive,
                  ),
                  counterText: "",
                  hintText: 'Input an Answer'),
            ),
          ],
        ),
      ),
    );
  }
}
