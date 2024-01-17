import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_get_controller.dart';
import 'package:study_first_ggs_later/modules/reviewer/controller/flash_card_get_controller.dart';

import 'package:study_first_ggs_later/modules/reviewer/models/fc_model.dart';

class ReviewerFcShuffleWidget extends StatelessWidget {
  final CardModel? cardModel;
  final Color? colorNotes;

  const ReviewerFcShuffleWidget({
    Key? key,
    this.cardModel,
    this.colorNotes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FcController fcController = Get.put(FcController());
    return Card(
      elevation: 0.0,
      margin: const EdgeInsets.only(
          left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),
      color: Colors.transparent,
      child: FlipCard(
        onFlipDone: (val) async {
          print('val: $val');
          if (val) {
            await fcController.flippedPoints();
          }
        },
        direction: FlipDirection.HORIZONTAL,
        side: CardSide.FRONT,
        speed: 500,
        front: Container(
          decoration: BoxDecoration(
            color: colorNotes,
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                child: Text(
                  cardModel!.cardFront,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        back: Container(
          decoration: BoxDecoration(
            color: colorNotes,
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                child: Text(
                  cardModel!.cardBack,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
