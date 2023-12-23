import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_get_controller.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';

class GameHomePlay extends StatelessWidget {
  const GameHomePlay({super.key});

  @override
  Widget build(BuildContext context) {
    // reinitialize controllers
    Get.delete<PlayerController>();
    Get.delete<EnemyController>();
    Get.delete<BattleController>();
    PlayerController playerController = Get.put(PlayerController());
    EnemyController enemyController = Get.put(EnemyController());
    BattleController battleController = Get.put(BattleController());

    return Scaffold(
      drawer: const NavDrawer(),
      appBar: const SharedAppBar(
        title: 'Game',
      ),
      body: Column(
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
                            // Align(
                            //   alignment: Alignment.center,
                            //   child: GetBuilder<PlayerController>(
                            //       // init: PlayerController(),
                            //       id: 'playerName',
                            //       builder: (controller) {
                            //         return Text(controller.playerName);
                            //       }),
                            // ),
                            // Align(
                            //   alignment: Alignment.bottomCenter,
                            //   child: GetBuilder<PlayerController>(
                            //       id: 'playerHealth',
                            //       builder: (controller) {
                            //         return Text(
                            //             'HP: ${controller.playerHealth}');
                            //       }),
                            // ),
                            Obx(
                              () => Align(
                                alignment: Alignment.center,
                                child: Text(playerController.playerName.value),
                              ),
                            ),
                            Obx(
                              () => Align(
                                alignment: Alignment.bottomCenter,
                                child: Text('HP: ${playerController.playerHealth.value}'),
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
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.width * 0.2,
                  child: InkWell(
                    onTap: () {
                      print('Attack');
                      battleController.playerAttack();
                    },
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Obx(
                          () => Align(
                            alignment: Alignment.center,
                            child: Text('Attack Damage: ${battleController.totalBattlePoints.value}'),
                          ),
                        ),
                      ],
                    ),
                  )),
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
                            print('Stats');
                            playerController.resetIsPlaying();
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
                                child: Text('Stats'),
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
                          onTap: () {
                            print('Inventory');
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
                                child: Text('Inventory'),
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
