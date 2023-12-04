// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'package:study_first_ggs_later/modules/reviewer/models/fc_model.dart';

class ReviewerFlashCardWidget extends StatelessWidget {
  final CardModel? cardModel;

  const ReviewerFlashCardWidget({
    Key? key,
    this.cardModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      margin: const EdgeInsets.all(48),
      color: Colors.white,
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        side: CardSide.FRONT,
        speed: 500,
        front: Container(
          height: 350,
          width: 300,
          decoration: const BoxDecoration(
            color: Color(0xFF0B6BA7),
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cardModel!.cardFront,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        back: Container(
          height: 350,
          width: 300,
          decoration: const BoxDecoration(
            color: Color(0xFF57BA5E),
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cardModel!.cardBack,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Poppins',
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
