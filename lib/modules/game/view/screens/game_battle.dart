import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_get_controller.dart';

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
      color: Colors.brown[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
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
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.width * 0.4,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const Align(
                                alignment: Alignment.topLeft,
                                child: Text('Player')),
                            Obx(
                              () => Align(
                                alignment: Alignment.center,
                                child: Text(playerController.playerName.value),
                              ),
                            ),
                            Obx(
                              () => Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                    'HP: ${playerController.playerTotalHealth.value}'),
                              ),
                            ),
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
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.width * 0.4,
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
                            // Align(
                            //   alignment: Alignment.center,
                            //   child: GetBuilder<EnemyController>(
                            //       // init: EnemyController(),
                            //       id: 'enemyName',
                            //       builder: (controller) {
                            //         return Text(Get.find<EnemyController>().enemyName);
                            //       }),
                            // ),
                            // Align(
                            //   alignment: Alignment.center,
                            //   child: GetBuilder<EnemyController>(
                            //       // init: EnemyController(),
                            //       id: 'enemyHealth',
                            //       builder: (controller) {
                            //         return Text('HP: ${Get.find<EnemyController>().enemyHealth}');
                            //       }),
                            // ),
                            Obx(
                              () => Align(
                                alignment: Alignment.center,
                                child: Text(enemyController.enemyName.value),
                              ),
                            ),
                            Obx(
                              () => Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                    'HP: ${enemyController.enemyHealth.value}'),
                              ),
                            ),
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
                                  : Colors.blue[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                                'Attack Damage: ${battleController.totalBattleDamage.value}'),
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
                    width: 10,
                  ),
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.1,
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
                                  text: const TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Skills',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          )),
                                      TextSpan(
                                          text: '\nComing Soon',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
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
                        height: MediaQuery.of(context).size.height * 0.1,
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
                              const Align(
                                alignment: Alignment.center,
                                child: Text('Run'),
                              ),
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
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
