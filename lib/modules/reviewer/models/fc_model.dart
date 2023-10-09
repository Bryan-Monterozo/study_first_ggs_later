class DeckModel {
  final String deckName;
  final String deckDesc;
  final String deckId;

  DeckModel(
      {required this.deckName, required this.deckDesc, required this.deckId});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'deckName': deckName,
      'deckDesc': deckDesc,
      'deckId': deckId,
    };
  }

  factory DeckModel.fromMap(Map<String, dynamic> map) {
    return DeckModel(
      deckName: map['deckName'] as String,
      deckDesc: map['deckDesc'] as String,
      deckId: map['deckId'] as String,
    );
  }
}

class CardModel {
  final String cardFront;
  final String cardBack;
  final String deckId;
  final String cardId;

  CardModel({required this.cardFront, required this.cardBack,required this.deckId, required this.cardId});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cardFront': cardFront,
      'cardBack': cardBack,
      'deckId': deckId,
      'cardId': cardId,
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      cardFront: map['cardFront'] as String,
      cardBack: map['cardBack'] as String,
      deckId: map['deckId'] as String,
      cardId: map['cardId'] as String,
    );
  }
}

class RandomCardModel {
  final String cardFront;
  final String cardBack;
  final String deckId;
  final String cardId;

  RandomCardModel({required this.cardFront, required this.cardBack, required this.deckId, required this.cardId});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cardFront': cardFront,
      'cardBack': cardBack,
      'deckId': deckId,
      'cardId': cardId,
    };
  }

  factory RandomCardModel.fromMap(Map<String, dynamic> map) {
    return RandomCardModel(
      cardFront: map['cardFront'] as String,
      cardBack: map['cardBack'] as String,
      deckId: map['deckId'] as String,
      cardId: map['cardId'] as String,
    );
  }
}

