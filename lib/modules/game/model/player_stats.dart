class PlayerStatModel {
  String playerId;
  String playerName;
  int playerLevel;
  int playerHealth;
  int playerDamage;
  int playerDefense;
  int playerExp;

  PlayerStatModel(
      {required this.playerId,
      required this.playerName,
      required this.playerLevel,
      required this.playerHealth,
      required this.playerDamage,
      required this.playerDefense,
      required this.playerExp});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'playerId': playerId,
      'playerName': playerName,
      'playerLevel': playerLevel,
      'playerHealth': playerHealth,
      'playerDamage': playerDamage,
      'playerDefense': playerDefense,
      'playerExp': playerExp,
    };
  }

  factory PlayerStatModel.fromMap(Map<String, dynamic> map) {
    return PlayerStatModel(
      playerId: map['playerId'] as String,
      playerName: map['playerName'] as String,
      playerLevel: map['playerLevel'] as int,
      playerHealth: map['playerHealth'] as int,
      playerDamage: map['playerDamage'] as int,
      playerDefense: map['playerDefense'] as int,
      playerExp: map['playerExp'] as int,
    );
  }
}

class PlayerMainModel {
  final int silver;
  final int gold;

  PlayerMainModel({required this.silver, required this.gold});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'silver': silver,
      'gold': gold,
    };
  }

  factory PlayerMainModel.fromMap(Map<String, dynamic> map) {
    return PlayerMainModel(
      silver: map['silver'] as int,
      gold: map['gold'] as int,
    );
  }
}
