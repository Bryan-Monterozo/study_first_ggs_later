import 'package:multiple_random_choice/multiple_random_choice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_first_ggs_later/modules/game/services/game_collection.dart';

class GamePageController extends GetxController {
  // controller
  late PageController pageController;
  int selectedIndex = 0;

  @override
  void onInit() async {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  onPageChanged(int index) {
    selectedIndex = index;
    update();
  }
}

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
    Get.find<PlayerController>().initPlayer().then((value) {
      spawnEnemy();
    });
  }

  spawnEnemy() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // isEnemySpawned = prefs.getBool('isEnemySpawned')!;

    if (prefs.getBool('isEnemySpawned') == null) {
      await prefs.setBool('isEnemySpawned', false);
      await prefs.setString('enemyId', enemyId.value);
      await prefs.setString('enemyName', enemyName.value);
      await prefs.setInt('enemyHealth', enemyHealth.value);
      await prefs.setInt('enemyDamage', enemyDamage.value);
      await prefs.setInt('enemyDefense', enemyDefense.value);
      await prefs.setInt('enemyExp', enemyExp.value);
      await prefs.setInt('enemySilver', enemySilver.value);
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
    final encounterChance = {
      '0': 10.0,
      '1': 10.0,
    };
    final encounterSet =
        randomMultipleWeightedChoice<String>(encounterChance, 1, null);
    // final index = Random().nextInt(randEnemy.length);
    // final randomizer = randEnemy[index];
    String randEnemy = encounterSet.join();
    print(randEnemy);

    await firestore
        .collection('Enemy')
        .doc(randEnemy)
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
    int playerLvl = prefs.getInt('playerLevel')!;
    Map<int, num> scaler = {};
    if (playerLvl > 5) {
      scaler = {
        (playerLvl - 5): 0.5,
        (playerLvl - 4): 1.0,
        (playerLvl - 3): 5.0,
        (playerLvl - 2): 10.0,
        (playerLvl - 1): 30.0,
        playerLvl: 20,
        (playerLvl + 1): 10.0,
        (playerLvl + 2): 5.0,
        (playerLvl + 3): 3.0,
        (playerLvl + 4): 1.0,
        (playerLvl + 5): 0.5,
      };
    }
    if (playerLvl > 4) {
      scaler = {
        (playerLvl - 4): 1.0,
        (playerLvl - 3): 5.0,
        (playerLvl - 2): 10.0,
        (playerLvl - 1): 30.0,
        playerLvl: 20,
        (playerLvl + 1): 9.0,
        (playerLvl + 2): 5.0,
        (playerLvl + 3): 1.0,
        (playerLvl + 4): 0.7,
      };
    }
    if (playerLvl > 3) {
      scaler = {
        (playerLvl - 3): 5.0,
        (playerLvl - 2): 10.0,
        (playerLvl - 1): 30.0,
        playerLvl: 20,
        (playerLvl + 1): 10.0,
        (playerLvl + 2): 5.0,
        (playerLvl + 3): 3.0,
      };
    } else {
      scaler = {
        playerLvl: 100.0,
      };
    }

    final randLvl = randomMultipleWeightedChoice(scaler, 1, null);
    String lvlString = randLvl.join();
    int scaledLvl = int.parse(lvlString);

    enemyHealth.value =
        enemyHealth.value * scaledLvl; //prefs.getInt('playerLevel')!
    enemyDamage.value =
        enemyDamage.value * scaledLvl; //prefs.getInt('playerLevel')!
    enemyDefense.value =
        enemyDefense.value * scaledLvl; //prefs.getInt('playerLevel')!
    enemyExp.value = enemyExp.value * scaledLvl; //prefs.getInt('playerLevel')!
    enemySilver.value =
        enemySilver.value * scaledLvl; //prefs.getInt('playerLevel')!

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
      await prefs.setInt('playerExp',
          (prefs.getInt('playerExp')! + prefs.getInt('enemyExp')! + 50));
      prefs.setBool('isEnemySpawned', false);
      deadEnemy();
      // await prefs.setBool('isEnemySpawned', false);
      // spawnEnemy();
    }
    // print('Enemy Spawned: $isEnemySpawned');
  }

  deadEnemy() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    enemyName.value = prefs.getString('enemyName')!;
    Get.find<PlayerController>().nextLevel();
    Get.defaultDialog(
      title: 'You Won!',
      middleText: 'You have defeated the $enemyName',
      confirm: ElevatedButton(
        onPressed: () async {
          // prefs.setInt('playerExp', prefs.getInt('playerExp')! + enemyExp);
          // prefs.setInt('playerSilver', prefs.getInt('playerSilver')! + enemySilver);
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
  RxInt skillUpPoints = 0.obs;
  RxInt nextLevelExp = 50.obs;

  RxInt playerTotalHealth = 10.obs;
  RxInt equipHealth = 0.obs;
  RxInt equipDamage = 0.obs;
  RxInt equipDefense = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    await initPlayer();
  }

  initPlayer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('isPlaying') == null) {
      final ref = await firestore
          .collection('Users')
          .doc(uid)
          .collection('Player')
          .doc('PlayerStats')
          .get();
      if (ref.exists) {
        await prefs.setBool('isPlaying', false);
        initPlayer();
        prefs.setInt('totalBattlePoints', 0);
      } else {
        await createNewPlayer();
        initPlayer();
      }
    } else {
      if (prefs.getBool('isPlaying') == false) {
        Get.find<BattleController>().initBattleSystem();
        fetchPlayerFromDB();
      } else {
        fetchCurrentPlayer();
        print(prefs.getBool('isPlaying'));
      }
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
      playerExp: basePlayerExp,
      nextLevelExp: nextLevelExp.value,
      skillUpPoints: skillUpPoints.value,
    );
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

    await prefs.setBool('isPlaying', true);

    playerName.value = prefs.getString('playerName')!;
    playerLevel.value = prefs.getInt('playerLevel')!;
    playerHealth.value = prefs.getInt('playerHealth')!;
    playerDamage.value = prefs.getInt('playerDamage')!;
    playerDefense.value = prefs.getInt('playerDefense')!;
    playerExp.value = prefs.getInt('playerExp')!;
    nextLevelExp.value = prefs.getInt('nextLevelExp')!;
    skillUpPoints.value = prefs.getInt('skillUpPoints')!;

    // player current equipment stats
    equipHealth.value = prefs.getInt('equipHealth')!;
    equipDamage.value = prefs.getInt('equipDamage')!;
    equipDefense.value = prefs.getInt('equipDefense')!;
    playerTotalHealth.value = prefs.getInt('playerTotalHealth')!;

    // update(['playerName', 'playerHealth']);

    print('Player Name: $playerName');
    print('Player Level: $playerLevel');
    print('Player Health: $playerHealth');
    print('Player Damage: $playerDamage');
    print('Player Defense: $playerDefense');
    print('Player Exp: $playerExp');
    print('Skill Up Points: $skillUpPoints');
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
    nextLevelExp.value = ref['nextLevelExp'];
    skillUpPoints.value = ref['skillUpPoints'];

    await prefs.setBool('isPlaying', true);

    // current player stats
    await prefs.setString('playerName', playerName.value);
    await prefs.setInt('playerLevel', playerLevel.value);
    await prefs.setInt('playerHealth', playerHealth.value);
    await prefs.setInt('playerDamage', playerDamage.value);
    await prefs.setInt('playerDefense', playerDefense.value);
    await prefs.setInt('playerExp', playerExp.value);
    await prefs.setInt('nextLevelExp', nextLevelExp.value);
    await prefs.setInt('skillUpPoints', skillUpPoints.value);

    // base player stats
    await prefs.setInt('basePlayerLevel', playerLevel.value);
    await prefs.setInt('basePlayerHealth', playerHealth.value);
    await prefs.setInt('basePlayerDamage', playerDamage.value);
    await prefs.setInt('basePlayerDefense', playerDefense.value);
    await prefs.setInt('basePlayerExp', playerExp.value);
    await prefs.setBool('isPlaying', true);

    // player equipment stat
    await prefs.setInt('equipHealth', 0);
    await prefs.setInt('equipDamage', 0);
    await prefs.setInt('equipDefense', 0);
    await prefs.setInt(
        'playerTotalHealth', (prefs.getInt('equipHealth')! + prefs.getInt('playerHealth')!));

    // print('Player Name: $playerName');
    // print('Player Level: $playerLevel');
    // print('Player Health: $playerHealth');
    // print('Player Damage: $playerDamage');
    // print('Player Defense: $playerDefense');
    // print('Player Exp: $playerExp');

    // update(['playerName', 'playerHealth']);
    fetchCurrentPlayer();
  }

  damagePlayer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    playerTotalHealth.value = prefs.getInt('playerTotalHealth')!;
    print('Player Health: ${playerTotalHealth.value}');
    // prefs.setBool('isPlaying', true);
    if (playerTotalHealth.value <= 0) {
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
          // await prefs.setInt('playerLevel', prefs.getInt('basePlayerLevel')!);
          await prefs.setInt('playerTotalHealth',
              prefs.getInt('basePlayerHealth')! + prefs.getInt('equipHealth')!);
          // await prefs.setInt('playerDamage', prefs.getInt('basePlayerDamage')! + prefs.getInt('equipDamage')!);
          // await prefs.setInt(
          //     'playerDefense', prefs.getInt('basePlayerDefense')!);
          // await prefs.setInt('playerExp', prefs.getInt('basePlayerExp')!);
          Get.find<PlayerController>().initPlayer();
          prefs.setBool('isEnemySpawned', false);
          Get.find<EnemyController>().spawnEnemy();
          Get.back();
        },
        child: Text('OK'),
      ),
    );
  }

  nextLevel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int playerxp = prefs.getInt('playerExp')!;
    int playerlvl = prefs.getInt('playerLevel')!;
    int nextLvlXp = prefs.getInt('nextLevelExp')!;
    // await prefs.setInt('nextLevelExp', nex);
    if (playerlvl < 5) {
      for (var i = 1; i <= 4; i++) {
        if (playerlvl == i) {
          if (playerxp >= nextLvlXp) {
            await levelUp();
            playerxp = prefs.getInt('playerExp')!;
            nextLvlXp = prefs.getInt('nextLevelExp')!;
            // break;
          } else {
            break;
          }
        }
      }
    }
    if (playerlvl == 5 && playerlvl < 10) {
      for (var i = 6; i <= 9; i++) {
        if (playerlvl == i) {
          // int nextLvlXp = (prefs.getInt('nextLevelExp')! * 3);
          // await prefs.setInt('nextLevelExp', nextLvlXp);
          if (playerxp >= nextLvlXp) {
            await levelUp();
            playerxp = prefs.getInt('playerExp')!;
            nextLvlXp = prefs.getInt('nextLevelExp')!;
            // break;
          } else {
            break;
          }
        } else {
          break;
        }
      }
    }
    print('Character Level: ${prefs.getInt('playerLevel')!}');
    print('Next Level Exp: ${prefs.getInt('nextLevelExp')!}');
    print('Skill Up Points: ${prefs.getInt('skillUpPoints')!}');
  }

  levelUp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int playerlvl = prefs.getInt('playerLevel')!;
    // int skillpts = prefs.getInt('skillUpPoints')!;
    if (playerlvl < 5) {
      for (var i = 1; i <= 4; i++) {
        if (playerlvl == i) {
          await prefs.setInt('playerLevel', prefs.getInt('playerLevel')! + 1);
          // playerlvl = prefs.getInt('playerLevel')!;
          await prefs.setInt(
              'skillUpPoints', prefs.getInt('skillUpPoints')! + 3);
          int nextLvlXp = (prefs.getInt('nextLevelExp')! * 2);
          nextLevelExp.value = nextLvlXp;
          await prefs.setInt('nextLevelExp', nextLvlXp);
          // playerLevel.value = prefs.getInt('playerLevel')!;
          // skillUpPoints.value = skillpts;
        }
      }
    }
    if (playerlvl == 5) {
      prefs.setInt('playerLevel', 6);
      playerlvl = prefs.getInt('playerLevel')!;
      prefs.setInt('skillUpPoints', prefs.getInt('skillUpPoints')! + 5);
      int nextLvlXp = (prefs.getInt('nextLevelExp')! * 3);
      nextLevelExp.value = nextLvlXp;
      await prefs.setInt('nextLevelExp', nextLvlXp);
      // playerLevel.value = prefs.getInt('playerLevel')!;
      // skillUpPoints.value = prefs.getInt('skillUpPoints')!;
    }
    if (playerlvl > 5) {
      for (var i = 6; i <= 9; i++) {
        if (playerlvl == i) {
          prefs.setInt('playerLevel', playerlvl++);
          playerlvl = prefs.getInt('playerLevel')!;
          prefs.setInt('skillUpPoints', prefs.getInt('skillUpPoints')! + 3);
          int nextLvlXp = (prefs.getInt('nextLevelExp')! * 3);
          nextLevelExp.value = nextLvlXp;
          await prefs.setInt('nextLevelExp', nextLvlXp);
          // playerLevel.value = prefs.getInt('playerLevel')!;
          // skillUpPoints.value = prefs.getInt('skillUpPoints')!;
        } else {
          break;
        }
      }
    }
  }

  upgradeStat(int upStat) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int skillPts = prefs.getInt('skillUpPoints')!;
    switch (upStat) {
      case 1:
        if (skillPts > 0) {
          prefs.setInt('playerHealth', prefs.getInt('playerHealth')! + 1);
          prefs.setInt('skillUpPoints', skillPts - 1);
          playerHealth.value = prefs.getInt('playerHealth')!;
          playerTotalHealth.value =
              prefs.getInt('playerHealth')! + prefs.getInt('equipHealth')!;
          skillUpPoints.value = prefs.getInt('skillUpPoints')!;
        }
        break;
      case 2:
        if (skillPts > 0) {
          prefs.setInt('playerDamage', prefs.getInt('playerDamage')! + 1);
          prefs.setInt('skillUpPoints', skillPts - 1);
          playerDamage.value = prefs.getInt('playerDamage')!;
          skillUpPoints.value = prefs.getInt('skillUpPoints')!;
        }
        break;
      case 3:
        if (skillPts > 0) {
          prefs.setInt('playerDefense', prefs.getInt('playerDefense')! + 1);
          prefs.setInt('skillUpPoints', skillPts - 1);
          playerDefense.value = prefs.getInt('playerDefense')!;
          skillUpPoints.value = prefs.getInt('skillUpPoints')!;
        }
        break;
      default:
        null;
        break;
    }
  }
}

class BattleController extends GetxController {
  // Services
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser!.uid;

  // Variables

  RxInt totalBattlePoints = 0.obs;
  RxBool isAttackDisabled = true.obs;
  RxInt totalBattleDamage = 0.obs;
  int quizPoints = 0;
  int fcPoints = 0;
  int pomodoroPoints = 0;
  int todoPoints = 0;

  // Methods
  // PlayerController playerController = PlayerController();
  // EnemyController enemyController = EnemyController();

  @override
  void onInit() async {
    super.onInit();
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    await initBattleSystem();
  }

  initBattleSystem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('totalBattlePoints') == null) {
      await prefs.setInt('totalBattlePoints', 0);
      await prefs.setInt('quizPoints', 0);
      await prefs.setInt('fcPoints', 0);
      await prefs.setInt('pomodoroPoints', 0);
      await prefs.setInt('todoPoints', 0);
    } else {
      battlePoints();
    }
  }

  void playerAttack() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int enemyHealth = prefs.getInt('enemyHealth')!;
    int enemyDefense = prefs.getInt('enemyDefense')!;
    int playerDamage =
        (prefs.getInt('playerDamage')! + prefs.getInt('equipDamage')!) *
            prefs.getInt('totalBattlePoints')!;

    int finalDamage = playerDamage - enemyDefense;
    if (finalDamage <= 0) {
      finalDamage = 1;
    }
    if (prefs.getInt('playerTotalHealth')! > 0) {
      enemyHealth = enemyHealth - finalDamage;
      await prefs.setInt('enemyHealth', enemyHealth);
      clearBattlePoints();
      enemyAttack();
    }
    Get.find<EnemyController>().damageEnemy();
  }

  void enemyAttack() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int playerTotalHealth =
        prefs.getInt('playerHealth')! + prefs.getInt('equipHealth')!;
    int playerDefense =
        prefs.getInt('playerDefense')! + prefs.getInt('equipDefense')!;
    int enemyDamage = prefs.getInt('enemyDamage')!;

    int finalDamage = playerDefense - enemyDamage;
    if (finalDamage <= 0) {
      finalDamage = 1;
    }

    if (prefs.getInt('enemyHealth')! > 0) {
      playerTotalHealth = playerTotalHealth - finalDamage;
      await prefs.setInt('playerTotalHealth', playerTotalHealth);
    }
    Get.find<PlayerController>().damagePlayer();
  }

  battlePoints() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    totalBattlePoints.value = prefs.getInt('totalBattlePoints')!;
    quizPoints = prefs.getInt('quizPoints')!;
    int equipDmg = prefs.getInt('equipDamage') ?? 0;
    int playerDmg = prefs.getInt('playerDamage') ?? 0;
    int scaledDamage = equipDmg + playerDmg;
    // quizPoints = prefs.getInt('quizPoints')!;
    totalBattlePoints.value = (quizPoints +
        fcPoints +
        pomodoroPoints +
        todoPoints +
        totalBattlePoints.value);
    totalBattleDamage.value = totalBattlePoints.value * scaledDamage;
    await prefs.setInt('quizPoints', 0);
    await prefs.setInt('totalBattlePoints', totalBattlePoints.value);
    // print('equiped Damage: ${prefs.getInt('equipDamage')!}');

    disableAttackButton(); // disable attack button if total battle points is 0
  }

  void clearBattlePoints() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('quizPoints', 0);
    await prefs.setInt('totalBattlePoints', 0);
    // totalBattlePoints.value = prefs.getInt('totalBattlePoints')!;
    totalBattleDamage.value = prefs.getInt('totalBattlePoints')! *
        (prefs.getInt('equipDamage')! + prefs.getInt('playerDamage')!);
    disableAttackButton(); // disable attack button if total battle points is 0
  }

  void disableAttackButton() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('totalBattlePoints')! <= 0) {
      isAttackDisabled.value = true;
    } else {
      isAttackDisabled.value = false;
    }
  }
}

class PlayerStatsController extends GetxController {}
