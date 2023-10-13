// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'package:study_first_ggs_later/modules/reviewer/models/fc_model.dart';

class ReviewerFcShuffleWidget extends StatelessWidget {
  final CardModel? cardModel;

  const ReviewerFcShuffleWidget({
    Key? key,
    this.cardModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      margin: const EdgeInsets.only(
          left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),
      color: Colors.transparent,
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        side: CardSide.FRONT,
        speed: 500,
        front: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF0B6BA7),
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                child: Text(
                  cardModel!.cardFront,
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        back: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF57BA5E),
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                child: Text(
                  cardModel!.cardBack,
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
