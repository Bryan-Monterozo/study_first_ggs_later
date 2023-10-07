import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_first_ggs_later/modules/reviewer/models/fc_model.dart';

class ReviewerFcDB {
  final firestore = FirebaseFirestore.instance;

  void addDeckToDB({
    required deckName,
    required deckDesc,
  }) async {
    final collection = firestore.collection('Decks').doc();

    DeckModel deckModel = DeckModel(
        deckName: deckName, deckDesc: deckDesc, deckId: collection.id);

    await collection.set(deckModel.toMap());
  }

  addCardToDeck({
    required cardFront,
    required cardBack,
    required deckId,
  }) async {
    final collection =
        firestore.collection('Decks').doc(deckId).collection('cards').doc();

    CardModel cardModel = CardModel(
        cardFront: cardFront,
        cardBack: cardBack,
        deckId: deckId,
        cardId: collection.id);

    await collection.set(cardModel.toMap());
  }

  editCardFromDeck({
    required cardFront,
    required cardBack,
    required deckId,
    required cardId,
  }) async {
    final collection = firestore
        .collection('Decks')
        .doc(deckId)
        .collection('cards')
        .doc(cardId);

    await collection.update({
      'cardFront': cardFront,
      'cardBack': cardBack,
    });
  }

  deleteDeckFromDB({
    required deckId,
    required cardId,
  }) async {
    await firestore.collection('Decks').doc(deckId).delete();
    await firestore.collection('Decks').doc(deckId).collection('cards').get().then((cards) {
      for (DocumentSnapshot doc in cards.docs) {
        doc.reference.delete();
      }
    });

    // firestore.collection('Decks').get().then((decks) {
    //   decks.docs.forEach((deckElement) {
    //     firestore.collection('Decks').doc(deckElement.id.toString()).collection('cards').get().then((cards) {
    //       cards.docs.forEach((cardElement) {
    //         firestore.collection('Decks').doc(deckElement.id.toString()).collection('cards').doc(cardElement.id.toString()).delete();
    //       });
    //     });
    //     firestore.collection('Decks').doc(deckElement.id.toString()).delete();
    //   });
    // });
  }

  deleteCardFromDeck({
    required deckId,
    required cardId,
  }) async {
    await firestore
        .collection('Decks')
        .doc(deckId)
        .collection('cards')
        .doc(cardId)
        .delete();
  }

  getCardCount({
    required deckId,
  }) async {
    QuerySnapshot collection = await FirebaseFirestore.instance
        .collection('Decks')
        .doc(deckId)
        .collection('cards')
        .get();

    return collection.docs.length;
  }
}
