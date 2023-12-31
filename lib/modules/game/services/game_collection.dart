import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:study_first_ggs_later/modules/game/model/player_stats.dart';

class GameDB {
  final firestore = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser!.uid;

  createPlayer({
    required playerLevel,
    required playerHealth,
    required playerDamage,
    required playerDefense,
    required playerExp,
  }) async {
    final collection = firestore
        .collection('Users')
        .doc(uid)
        .collection('Player')
        .doc('PlayerStats');
    final ref = await firestore.collection('Users').doc(uid).get();
    final username = ref['userName'];
    PlayerStatModel playerModel = PlayerStatModel(
      playerId: uid,
      playerName: username,
      playerLevel: playerLevel,
      playerHealth: playerHealth,
      playerDamage: playerDamage,
      playerDefense: playerDefense,
      playerExp: playerExp,
    );
    await collection.set(playerModel.toMap());
  }
}

class GameShopDB {
  final firestore = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser!.uid;

  
}