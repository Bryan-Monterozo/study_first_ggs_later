import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_get_controller.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_sprite.dart';

class GameBattlePage extends StatelessWidget {
  const GameBattlePage({super.key});

  @override
  Widget build(BuildContext context) {
    // reinitialize controllers
    Get.delete<PlayerController>();
    Get.delete<EnemyController>();
    Get.delete<BattleController>();
    PlayerController playerController = Get.put(PlayerController());
    EnemyController enemyController = Get.put(EnemyController());
    BattleController battleController = Get.put(BattleController());
    print('rebuilt');
    return Container(
      color: const Color(0xFFD4D5D5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                width: 15,
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.width * 0.5,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: GameWidget(
                                game: UserSprite(),
                              ),
                            ),
                            Obx(
                              () => Align(
                                alignment: Alignment.topRight
                                    .add(const Alignment(-0.1, 0.15)),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.20,
                                  child: LinearPercentIndicator(
                                    width: MediaQuery.of(context).size.width *
                                        0.20,
                                    lineHeight: 10.0,
                                    animation: true,
                                    animationDuration: 750,
                                    percent: playerController
                                            .playerTotalHealth.value /
                                        playerController.playerMaxHealth.value,
                                    progressColor: Colors.green,
                                    backgroundColor: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            Obx(
                              () => Align(
                                alignment: Alignment.topLeft
                                    .add(const Alignment(0.1, 0.10)),
                                child: Text(
                                    'HP: ${playerController.playerTotalHealth.value}',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Obx(
                              () => Align(
                                // right: MediaQuery.of(context).size.width *
                                //     0.16, //higher = right
                                // bottom: MediaQuery.of(context).size.width *
                                //     0.06, // lower = down
                                alignment: Alignment.bottomCenter
                                    .add(const Alignment(0.0, -0.07)),
                                child: Text(
                                  playerController.playerName.value,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Obx(
                              () => battleController.enemyBattleSlash.value
                                  ? Align(
                                      alignment: Alignment.center,
                                      child: GameWidget(game: SlashSprite()),
                                    )
                                  : Container(),
                            )
                          ],
                        )),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.width * 0.5,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.red[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const Align(
                                alignment: Alignment.topRight,
                                child: Text('Enemy')),
                            Obx(
                              () => Align(
                                alignment: Alignment.center,
                                child: () {
                                  if (enemyController.enemyName.value == 'Ghost') {
                                    return GameWidget(game: GhostSprite());
                                  } if (enemyController.enemyName.value == 'Skeleton') {
                                    return GameWidget(game: SkeletonSprite());
                                  } if (enemyController.enemyName.value == 'Ninja') {
                                    return GameWidget(game: NinjaSprite());
                                  } if (enemyController.enemyName.value == 'Dwarf') {
                                    return GameWidget(game: DwarfSprite());
                                  } else {
                                    return Container();
                                  }
                                }(),
                              ),
                            ),
                            Obx(
                              () => Align(
                                alignment: Alignment.topLeft
                                    .add(const Alignment(0.1, 0.15)),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.20,
                                  child: LinearPercentIndicator(
                                    width: MediaQuery.of(context).size.width *
                                        0.20,
                                    lineHeight: 10.0,
                                    animation: true,
                                    animationDuration: 750,
                                    percent: enemyController.enemyHealth.value /
                                        enemyController.enemyMaxHealth.value,
                                    progressColor: Colors.green,
                                    backgroundColor: Colors.red,
                                    isRTL: true,
                                  ),
                                ),
                              ),
                            ),
                            Obx(
                              () => Align(
                                alignment: Alignment.topRight
                                    .add(const Alignment(-0.1, 0.10)),
                                child: Text(
                                    'HP: ${enemyController.enemyHealth.value}',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Obx(
                              () => battleController.playerBattleSlash.value
                                  ? Align(
                                      alignment: Alignment.center,
                                      child: GameWidget(game: SlashSprite()),
                                    )
                                  : Container(),
                            )
                          ],
                        )),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Obx(
                () => SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 0.2,
                    child: InkWell(
                      onTap: () {
                        if (battleController.isAttackDisabled.value) {
                          null;
                        } else {
                          print('Attack');
                          battleController.playerAttack();
                        }
                      },
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: battleController.isAttackDisabled.value
                                  ? Colors.grey[400]
                                  : Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Attack Damage: ${battleController.totalBattleDamage.value}',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    width: 45,
                  ),
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: InkWell(
                          onTap: () {
                            print('Skills');
                          },
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.red[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Skills',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Colors.black,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      TextSpan(
                                          text: '\nComing Soon',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Colors.black,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03,
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: InkWell(
                          onTap: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            print('Ran');
                            await prefs.setBool('isEnemySpawned', false);
                            enemyController.spawnEnemy();
                          },
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.red[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text('Run',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 45,
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
