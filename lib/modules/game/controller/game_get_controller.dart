import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_first_ggs_later/modules/game/services/game_collection.dart';

class EnemyController extends GetxController {
  // Variables
  // bool isEnemySpawned = false;
  // String enemyId = '';
  // String enemyName = '';
  // int enemyHealth = 0;
  // int enemyDamage = 0;
  // int enemyDefense = 0;
  // int enemyExp = 0;
  // int enemySilver = 0;

  // RxBool isEnemySpawned = false.obs;
  RxString enemyId = ''.obs;
  RxString enemyName = ''.obs;
  RxInt enemyHealth = 0.obs;
  RxInt enemyDamage = 0.obs;
  RxInt enemyDefense = 0.obs;
  RxInt enemyExp = 0.obs;
  RxInt enemySilver = 0.obs;

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
    // isEnemySpawned = prefs.getBool('isEnemySpawned')!;

    if (prefs.getBool('isEnemySpawned') == null) {
      await prefs.setBool('isEnemySpawned', false);
    }

    if (prefs.getBool('isEnemySpawned') == false) {
      // await prefs.setBool('isEnemySpawned', true);
      // isEnemySpawned.value = prefs.getBool('isEnemySpawned')!;
      fetchEnemy();

      enemyName.value = prefs.getString('enemyName')!;
      enemyHealth.value = prefs.getInt('enemyHealth')!;
      enemyDamage.value = prefs.getInt('enemyDamage')!;
      enemyDefense.value = prefs.getInt('enemyDefense')!;
      enemyExp.value = prefs.getInt('enemyExp')!;
      enemySilver.value = prefs.getInt('enemySilver')!;
      // print('triggered 1');
      await prefs.setBool('isEnemySpawned', true);

      update(['enemyName', 'enemyHealth']);
    } else {
      prefs.setBool('isEnemySpawned', true);
      // isEnemySpawned = prefs.getBool('isEnemySpawned')!;
      enemyId.value = prefs.getString('enemyId')!;
      enemyName.value = prefs.getString('enemyName')!;
      enemyHealth.value = prefs.getInt('enemyHealth')!;
      enemyDamage.value = prefs.getInt('enemyDamage')!;
      enemyDefense.value = prefs.getInt('enemyDefense')!;
      enemyExp.value = prefs.getInt('enemyExp')!;
      enemySilver.value = prefs.getInt('enemySilver')!;
      // print('triggered 2');
      // update(['enemyName', 'enemyHealth']);
    }
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
      enemyId.value = value['enemyId'];
      enemyName.value = value['enemyName'];
      enemyHealth.value = value['baseHealth'];
      enemyDamage.value = value['baseDamage'];
      enemyDefense.value = value['baseDefense'];
      enemyExp.value = value['baseExp'];
      enemySilver.value = value['baseSilver'];
    });

    scaleEnemy();
  }

  scaleEnemy() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    const playerLevel = 1;
    enemyHealth.value =
        enemyHealth.value * playerLevel; //prefs.getInt('playerLevel')!
    enemyDamage.value =
        enemyDamage.value * playerLevel; //prefs.getInt('playerLevel')!
    enemyDefense.value =
        enemyDefense.value * playerLevel; //prefs.getInt('playerLevel')!
    enemyExp.value =
        enemyExp.value * playerLevel; //prefs.getInt('playerLevel')!
    enemySilver.value =
        enemySilver.value * playerLevel; //prefs.getInt('playerLevel')!

    // print('Enemy Spawned: $isEnemySpawned');
    print('Enemy Name: $enemyName');
    print('Enemy Health: $enemyHealth');
    print('Enemy Damage: $enemyDamage');
    print('Enemy Defense: $enemyDefense');
    print('Enemy Exp: $enemyExp');
    print('Enemy Silver: $enemySilver');

    await prefs.setString('enemyId', enemyId.value);
    await prefs.setString('enemyName', enemyName.value);
    await prefs.setInt('enemyHealth', enemyHealth.value);
    await prefs.setInt('enemyDamage', enemyDamage.value);
    await prefs.setInt('enemyDefense', enemyDefense.value);
    await prefs.setInt('enemyExp', enemyExp.value);
    await prefs.setInt('enemySilver', enemySilver.value);
  }

  damageEnemy() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    enemyHealth.value = prefs.getInt('enemyHealth')!;
    // isEnemySpawned.value = prefs.getBool('isEnemySpawned')!;
    print('Enemy Health: $enemyHealth');
    if (enemyHealth <= 0) {
      deadEnemy();
      // await prefs.setBool('isEnemySpawned', false);
      // spawnEnemy();
    }
    // print('Enemy Spawned: $isEnemySpawned');
  }

  deadEnemy() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    enemyName.value = prefs.getString('enemyName')!;
    Get.defaultDialog(
      title: 'You Won!',
      middleText: 'You have defeated the $enemyName',
      confirm: ElevatedButton(
        onPressed: () async {
          // prefs.setInt('playerExp', prefs.getInt('playerExp')! + enemyExp);
          // prefs.setInt('playerSilver', prefs.getInt('playerSilver')! + enemySilver);
          prefs.setBool('isEnemySpawned', false);
          spawnEnemy();
          Get.back();
        },
        child: Text('OK'),
      ),
    );
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
  int basePlayerLevel = 1;
  int basePlayerHealth = 10;
  int basePlayerDamage = 2;
  int basePlayerDefense = 2;
  int basePlayerExp = 0;

  RxString playerName = ''.obs;
  RxBool playerIsDead = false.obs;
  RxInt playerLevel = 1.obs;
  RxInt playerHealth = 10.obs;
  RxInt playerDamage = 2.obs;
  RxInt playerDefense = 2.obs;
  RxInt playerExp = 0.obs;

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
        initPlayer();
      } else {
        if (prefs.getBool('isPlaying') == false) {
          fetchPlayerFromDB();
        } else {
          fetchCurrentPlayer();
          print(prefs.getBool('isPlaying'));
        }
      }
    } else {
      createNewPlayer();
    }
  }

  resetIsPlaying() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isPlaying', false);
  }

  createNewPlayer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // final playerStats = firestore.collection('Users').doc(uid).collection('Player').doc('PlayerStats').get();
    await gameDB.createPlayer(
        playerLevel: basePlayerLevel,
        playerHealth: basePlayerHealth,
        playerDamage: basePlayerDamage,
        playerDefense: basePlayerDefense,
        playerExp: basePlayerExp);
    prefs.setBool('isPlaying', false);
    print('triggered2');
    // await initPlayer();
  }

  fetchCurrentPlayer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setString('playerName', playerName.value);
    // await prefs.setInt('playerLevel', basePlayerLevel);
    // await prefs.setInt('playerHealth', basePlayerHealth);
    // await prefs.setInt('playerDamage', basePlayerDamage);
    // await prefs.setInt('playerDefense', basePlayerDefense);
    // await prefs.setInt('playerExp', basePlayerExp);

    playerName.value = prefs.getString('playerName')!;
    playerLevel.value = prefs.getInt('playerLevel')!;
    playerHealth.value = prefs.getInt('playerHealth')!;
    playerDamage.value = prefs.getInt('playerDamage')!;
    playerDefense.value = prefs.getInt('playerDefense')!;
    playerExp.value = prefs.getInt('playerExp')!;

    // update(['playerName', 'playerHealth']);

    print('Player Name: $playerName');
    print('Player Level: $playerLevel');
    print('Player Health: $playerHealth');
    print('Player Damage: $playerDamage');
    print('Player Defense: $playerDefense');
    print('Player Exp: $playerExp');
  }

  fetchPlayerFromDB() async {
    print('triggered3');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final ref = await firestore
        .collection('Users')
        .doc(uid)
        .collection('Player')
        .doc('PlayerStats')
        .get();
    playerName.value = ref['playerName'];
    playerLevel.value = ref['playerLevel'];
    playerHealth.value = ref['playerHealth'];
    playerDamage.value = ref['playerDamage'];
    playerDefense.value = ref['playerDefense'];
    playerExp.value = ref['playerExp'];

    // current player stats
    await prefs.setString('playerName', playerName.value);
    await prefs.setInt('playerLevel', playerLevel.value);
    await prefs.setInt('playerHealth', playerHealth.value);
    await prefs.setInt('playerDamage', playerDamage.value);
    await prefs.setInt('playerDefense', playerDefense.value);
    await prefs.setInt('playerExp', playerExp.value);

    // base player stats
    await prefs.setInt('basePlayerLevel', playerLevel.value);
    await prefs.setInt('basePlayerHealth', playerHealth.value);
    await prefs.setInt('basePlayerDamage', playerDamage.value);
    await prefs.setInt('basePlayerDefense', playerDefense.value);
    await prefs.setInt('basePlayerExp', playerExp.value);
    await prefs.setBool('isPlaying', true);

    // print('Player Name: $playerName');
    // print('Player Level: $playerLevel');
    // print('Player Health: $playerHealth');
    // print('Player Damage: $playerDamage');
    // print('Player Defense: $playerDefense');
    // print('Player Exp: $playerExp');

    // update(['playerName', 'playerHealth']);
  }

  damagePlayer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    playerHealth.value = prefs.getInt('playerHealth')!;
    print('Player Health: ${playerHealth.value}');
    // prefs.setBool('isPlaying', true);
    if (playerHealth.value <= 0) {
      deadPlayer();
    }
  }

  deadPlayer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Get.defaultDialog(
      title: 'You Died!',
      middleText: 'You have been defeated by the enemy',
      confirm: ElevatedButton(
        onPressed: () async {
          await prefs.setInt('playerLevel', prefs.getInt('basePlayerLevel')!);
          await prefs.setInt('playerHealth', prefs.getInt('basePlayerHealth')!);
          await prefs.setInt('playerDamage', prefs.getInt('basePlayerDamage')!);
          await prefs.setInt(
              'playerDefense', prefs.getInt('basePlayerDefense')!);
          await prefs.setInt('playerExp', prefs.getInt('basePlayerExp')!);
          Get.find<PlayerController>().initPlayer();
          prefs.setBool('isEnemySpawned', false);
          Get.find<EnemyController>().spawnEnemy();
          Get.back();
        },
        child: Text('OK'),
      ),
    );
  }
}

class BattleController extends GetxController {
  // Services
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser!.uid;

  // Variables

  RxInt totalBattlePoints = 0.obs;
  int quizPoints = 0;
  int fcPoints = 0;
  int pomodorPoints = 0;
  int todoPoints = 0;

  // Methods
  // PlayerController playerController = PlayerController();
  // EnemyController enemyController = EnemyController();

  @override
  void onInit() async {
    super.onInit();
    battlePointsQuiz();
  }

  playerAttack() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int enemyHealth = prefs.getInt('enemyHealth')!;
    int enemyDefense = prefs.getInt('enemyDefense')!;
    int playerDamage = prefs.getInt('playerDamage')!;
    totalBattlePoints.value = prefs.getInt('totalBattlePoints')!;

    int finalDamage = (playerDamage * totalBattlePoints.value) - enemyDefense;
    if (finalDamage <= 0) {
      finalDamage = 1;
    }
    if (prefs.getInt('playerHealth')! > 0) {
      enemyHealth = enemyHealth - finalDamage;
      await prefs.setInt('enemyHealth', enemyHealth);
      clearBattlePoints();
      enemyAttack();
    }
    Get.find<EnemyController>().damageEnemy();
  }

  enemyAttack() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int playerHealth = prefs.getInt('playerHealth')!;
    int playerDefense = prefs.getInt('playerDefense')!;
    int enemyDamage = prefs.getInt('enemyDamage')!;

    int finalDamage = playerDefense - enemyDamage;
    if (finalDamage <= 0) {
      finalDamage = 1;
    }

    if (prefs.getInt('enemyHealth')! > 0) {
      playerHealth = playerHealth - finalDamage;
      await prefs.setInt('playerHealth', playerHealth);
    }
    Get.find<PlayerController>().damagePlayer();
  }

  battlePointsQuiz() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    quizPoints = prefs.getInt('quizPoints')!;
    totalBattlePoints.value = quizPoints + fcPoints + pomodorPoints + todoPoints;

    await prefs.setInt('totalBattlePoints', totalBattlePoints.value);
  }

  clearBattlePoints() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('quizPoints', 0);
    await prefs.setInt('totalBattlePoints', 0);
    totalBattlePoints.value = prefs.getInt('totalBattlePoints')!;
  }
}
