class EnemyModel {
  String enemyId;
  String enemyName;
  int baseHealth;
  int baseDamage;
  int baseDefense;
  int baseExp;
  int baseSilver;

  EnemyModel(
      {required this.enemyId,
      required this.enemyName,
      required this.baseHealth,
      required this.baseDamage,
      required this.baseDefense,
      required this.baseExp,
      required this.baseSilver,
    });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'enemyId': enemyId,
      'enemyName': enemyName,
      'baseHealth': baseHealth,
      'baseDamage': baseDamage,
      'baseDefense': baseDefense,
      'baseExp': baseExp,
      'baseSilver': baseSilver,
    };
  }

  factory EnemyModel.fromMap(Map<String, dynamic> map) {
    return EnemyModel(
      enemyId: map['enemyId'] as String,
      enemyName: map['enemyName'] as String,
      baseHealth: map['baseHealth'] as int,
      baseDamage: map['baseDamage'] as int,
      baseDefense: map['baseDefense'] as int,
      baseExp: map['baseExp'] as int,
      baseSilver: map['baseSilver'] as int,
    );
  }
}
