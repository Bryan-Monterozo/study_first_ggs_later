import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_first_ggs_later/modules/game/services/game_collection.dart';

class EnemyController extends GetxController {
  // Variables
  bool isEnemySpawned = false;
  String enemyId = '';
  String enemyName = '';
  int enemyHealth = 0;
  int enemyDamage = 0;
  int enemyDefense = 0;
  int enemyExp = 0;
  int enemySilver = 0;

  //methods
  // PlayerController playerController = PlayerController();
  // BattleController battleController = BattleController();

  @override
  void onInit() async {
    super.onInit();
    spawnEnemy();
  }

  spawnEnemy() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isEnemySpawned = prefs.getBool('isEnemySpawned')!;

    if (prefs.getBool('isEnemySpawned') == null) {
      await prefs.setBool('isEnemySpawned', false);
      print('Enemy Spawned 1: $isEnemySpawned');
    } else {
      isEnemySpawned = prefs.getBool('isEnemySpawned')!;
      print('Enemy Spawned 2: $isEnemySpawned');
    }

    if (isEnemySpawned == false) {
      // await prefs.setBool('isEnemySpawned', true);
      isEnemySpawned = prefs.getBool('isEnemySpawned')!;
      fetchEnemy();

      enemyId = prefs.getString('enemyId')!;
      enemyName = prefs.getString('enemyName')!;
      enemyHealth = prefs.getInt('enemyHealth')!;
      enemyDamage = prefs.getInt('enemyDamage')!;
      enemyDefense = prefs.getInt('enemyDefense')!;
      enemyExp = prefs.getInt('enemyExp')!;
      enemySilver = prefs.getInt('enemySilver')!;
      print('triggered 1');
      await prefs.setBool('isEnemySpawned', true);

      // update(['enemyName', 'enemyHealth']);
    } else {
      prefs.setBool('isEnemySpawned', true);
      // isEnemySpawned = prefs.getBool('isEnemySpawned')!;
      enemyId = prefs.getString('enemyId')!;
      enemyName = prefs.getString('enemyName')!;
      enemyHealth = prefs.getInt('enemyHealth')!;
      enemyDamage = prefs.getInt('enemyDamage')!;
      enemyDefense = prefs.getInt('enemyDefense')!;
      enemyExp = prefs.getInt('enemyExp')!;
      enemySilver = prefs.getInt('enemySilver')!;
      print('triggered 2');
      // update(['enemyName', 'enemyHealth']);
    }
    update(['enemyName', 'enemyHealth']);
  }

  // TODO: add this to pubspec ---> multiple_random_choice: ^0.1.3+1

  fetchEnemy() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final list = ['0', '1'];
    final index = Random().nextInt(list.length);
    final randomizer = list[index];

    await firestore
        .collection('Enemy')
        .doc(randomizer)
        .get()
        .then((value) async {
      enemyId = value['enemyId'];
      enemyName = value['enemyName'];
      enemyHealth = value['baseHealth'];
      enemyDamage = value['baseDamage'];
      enemyDefense = value['baseDefense'];
      enemyExp = value['baseExp'];
      enemySilver = value['baseSilver'];
    });

    scaleEnemy();
  }

  scaleEnemy() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    const playerLevel = 1;
    enemyHealth = enemyHealth * playerLevel; //prefs.getInt('playerLevel')!
    enemyDamage = enemyDamage * playerLevel; //prefs.getInt('playerLevel')!
    enemyDefense = enemyDefense * playerLevel; //prefs.getInt('playerLevel')!
    enemyExp = enemyExp * playerLevel; //prefs.getInt('playerLevel')!
    enemySilver = enemySilver * playerLevel; //prefs.getInt('playerLevel')!

    print('Enemy Spawned: $isEnemySpawned');
    print('Enemy Name: $enemyName');
    print('Enemy Health: $enemyHealth');
    print('Enemy Damage: $enemyDamage');
    print('Enemy Defense: $enemyDefense');
    print('Enemy Exp: $enemyExp');
    print('Enemy Silver: $enemySilver');

    await prefs.setString('enemyId', enemyId);
    await prefs.setString('enemyName', enemyName);
    await prefs.setInt('enemyHealth', enemyHealth);
    await prefs.setInt('enemyDamage', enemyDamage);
    await prefs.setInt('enemyDefense', enemyDefense);
    await prefs.setInt('enemyExp', enemyExp);
    await prefs.setInt('enemySilver', enemySilver);
  }

  damageEnemy() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    enemyHealth = prefs.getInt('enemyHealth')!;
    isEnemySpawned = prefs.getBool('isEnemySpawned')!;
    print('Enemy Health: $enemyHealth');

    if (enemyHealth <= 0) {
      await prefs.setBool('isEnemySpawned', false);
      spawnEnemy();
    } else {
      // await prefs.setBool('isEnemySpawned', true);
      update(['enemyHealth', 'enemyName']);
    }
    print('Enemy Spawned: $isEnemySpawned');
  }
}

class PlayerController extends GetxController {
  // Services
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser!.uid;

  // Methods
  GameDB gameDB = GameDB();
  // EnemyController enemyController = EnemyController();
  // BattleController battleController = BattleController();

  // variables
  String playerName = '';
  int playerLevel = 1;
  int playerHealth = 10;
  int playerDamage = 2;
  int playerDefense = 2;
  int playerExp = 0;

  @override
  void onInit() async {
    super.onInit();
    initPlayer();
  }

  initPlayer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final ref = await firestore
        .collection('Users')
        .doc(uid)
        .collection('Player')
        .doc('PlayerStats')
        .get();
    if (ref.exists) {
      if (prefs.getBool('isPlaying') == null) {
        await prefs.setBool('isPlaying', false);
      } else {
        if (prefs.getBool('isPlaying') == false) {
          fetchPlayerFromDB();
        } else {
          fetchCurrentPlayer();
        }
      }
    } else {
      createNewPlayer();
      print('triggered1');
    }
  }

  createNewPlayer() async {
    // final playerStats = firestore.collection('Users').doc(uid).collection('Player').doc('PlayerStats').get();
    gameDB.createPlayer(
        playerLevel: playerLevel,
        playerHealth: playerHealth,
        playerDamage: playerDamage,
        playerDefense: playerDefense,
        playerExp: playerExp);
    print('triggered2');
    fetchPlayerFromDB();
  }

  fetchCurrentPlayer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    playerName = prefs.getString('playerName')!;
    playerLevel = prefs.getInt('playerLevel')!;
    playerHealth = prefs.getInt('playerHealth')!;
    playerDamage = prefs.getInt('playerDamage')!;
    playerDefense = prefs.getInt('playerDefense')!;
    playerExp = prefs.getInt('playerExp')!;

    update(['playerName', 'playerHealth']);

    print('Player Name: $playerName');
    print('Player Level: $playerLevel');
    print('Player Health: $playerHealth');
    print('Player Damage: $playerDamage');
    print('Player Defense: $playerDefense');
    print('Player Exp: $playerExp');
  }

  fetchPlayerFromDB() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final ref = await firestore
        .collection('Users')
        .doc(uid)
        .collection('Player')
        .doc('PlayerStats')
        .get();
    playerName = ref['playerName'];
    playerLevel = ref['playerLevel'];
    playerHealth = ref['playerHealth'];
    playerDamage = ref['playerDamage'];
    playerDefense = ref['playerDefense'];
    playerExp = ref['playerExp'];

    await prefs.setString('playerName', playerName);
    await prefs.setInt('playerLevel', playerLevel);
    await prefs.setInt('playerHealth', playerHealth);
    await prefs.setInt('playerDamage', playerDamage);
    await prefs.setInt('playerDefense', playerDefense);
    await prefs.setInt('playerExp', playerExp);
    await prefs.setBool('isPlaying', true);

    print('Player Name: $playerName');
    print('Player Level: $playerLevel');
    print('Player Health: $playerHealth');
    print('Player Damage: $playerDamage');
    print('Player Defense: $playerDefense');
    print('Player Exp: $playerExp');

    update(['playerName', 'playerHealth']);
  }
}

class BattleController extends GetxController {
  // Services
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser!.uid;

  // Methods
  // PlayerController playerController = PlayerController();
  // EnemyController enemyController = EnemyController();

  playerAttack() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int enemyHealth = prefs.getInt('enemyHealth')!;
    int enemyDefense = prefs.getInt('enemyDefense')!;
    int playerDamage = prefs.getInt('playerDamage')!;

    int finalDamage = playerDamage - enemyDefense;
    if (finalDamage <= 0) {
      finalDamage = 1;
    }
    enemyHealth = enemyHealth - finalDamage;
    await prefs.setInt('enemyHealth', enemyHealth);

    // print('Enemy Health: $enemyHealth');
    // if (enemyHealth <= 0) {
    //   await prefs.setBool('isEnemySpawned', false);
    //   EnemyController().spawnEnemy();
    // } else {
    //   EnemyController().damageEnemy();
    // }
  }
}
