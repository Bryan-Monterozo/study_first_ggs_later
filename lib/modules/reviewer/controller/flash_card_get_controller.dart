import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_get_controller.dart';
import 'package:study_first_ggs_later/modules/reviewer/models/fc_premade.dart';
import 'package:study_first_ggs_later/modules/reviewer/services/reviewer_fc_collection.dart';

class FcController extends GetxController {
  RxInt flipPoints = 0.obs;
  RxInt totalFlipPoints = 0.obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser!.uid;
  ReviewerFcDB reviewerFcDB = ReviewerFcDB();
  PremadeDeck premadeDeck = PremadeDeck();

  @override
  void onInit() async {
    super.onInit();
    premadeDecks();
  }

  premadeDecks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('fcLoaded') == null) {
      final ref = await firestore
          .collection('Users')
          .doc(uid)
          .collection('Decks')
          .get();
      await prefs.setBool('fcLoaded', true);
      if (ref.docs.isEmpty) {
        for (int i = 1; i <= 4; i++) {
          reviewerFcDB
              .addDeckToDB(
                  deckName: premadeDeck.premadeDeckName(i),
                  deckDesc: premadeDeck.premadeDeckDesc(i))
              .then((value) {
            String id = prefs.getString('deckId')!;
            for (int j = 1; j <= 5; j++) {
              int x = i * 100;
              reviewerFcDB.addCardToDeck(
                  cardFront: premadeDeck.premadeCardFront(j + x),
                  cardBack: premadeDeck.premadeCardBack(j + x),
                  deckId: id);
            }
          });
        }
      }
    }
  }

  flippedPoints() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('flippedPoints');
    flipPoints.value = prefs.getInt('flipPoints') ?? 0;
    totalFlipPoints.value = prefs.getInt('totalFlipPoints') ?? 0;
    if (flipPoints.value < 3) {
      await prefs.setInt('flipPoints', (prefs.getInt('flipPoints') ?? 0) + 1);
    } else {
      await prefs.setInt(
          'totalFlipPoints', (prefs.getInt('totalFlipPoints') ?? 0) + 1);
      await prefs.setInt('flipPoints', 0);
    }
    print(prefs.getInt('flipPoints'));
    print(prefs.getInt('totalFlipPoints'));
    BattleController().battlePoints();
  }
}
