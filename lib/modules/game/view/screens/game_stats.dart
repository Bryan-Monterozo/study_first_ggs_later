import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_get_controller.dart';
import 'package:study_first_ggs_later/modules/game/view/widgets/game_buttons.dart';
import 'package:study_first_ggs_later/modules/game/view/widgets/text_styles.dart';

class GameSatsPage extends StatelessWidget {
  const GameSatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // reinitialize controllers
    Get.delete<PlayerController>();
    Get.delete<PlayerStatsController>();
    PlayerController playerController = Get.put(PlayerController());
    // ignore: unused_local_variable
    PlayerStatsController playerStatsController =
        Get.put(PlayerStatsController());

    return Container(
      color: Colors.yellow[300],
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          //player show box
          Flexible(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.width * 0.5,
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          //player name and level
          Flexible(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Character Name:'),
                  const SizedBox(
                    width: 10,
                  ),
                  Obx(() => Text(playerController.playerName.value)),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Character Level:'),
                  const SizedBox(
                    width: 10,
                  ),
                  Obx(() => Text('${playerController.playerLevel.value}')),
                ],
              ),
            ],
          )),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.05,
          // ),
          //player stats
          Flexible(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        statsText(' HP', null),
                        statsText('DMG', null),
                        statsText('DEF', null),
                        statsText('EXP', null),
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(() => statsText(
                            playerController.playerHealth.value.toString(),
                            playerController.equipHealth.value.toString())),
                        Obx(() => statsText(
                            playerController.playerDamage.value.toString(),
                            playerController.equipDamage.value.toString())),
                        Obx(() => statsText(
                            playerController.playerDefense.value.toString(),
                            playerController.equipDefense.value.toString())),
                        Obx(() => statsText(
                            playerController.playerExp.value.toString(), null)),
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                  Obx(
                    () => SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: playerController.skillUpPoints.value > 0
                              ? <Widget>[
                                  statsUpButton(() {
                                    playerController.upgradeStat(1);
                                  }, Colors.yellow, Colors.yellow[600]!,
                                      Colors.white),
                                  statsUpButton(() {
                                    playerController.upgradeStat(2);
                                  }, Colors.yellow,
                                      Colors.yellow[600]!, Colors.white),
                                  statsUpButton(() {
                                    playerController.upgradeStat(3);
                                  }, Colors.yellow,
                                      Colors.yellow[600]!, Colors.white),
                                  statsText(
                                      playerController.nextLevelExp.value
                                          .toString(),
                                      null),
                                  // Obx(() => IconButton(
                                  //     onPressed: () {},
                                  //     icon: const Icon(
                                  //         Icons.keyboard_double_arrow_up_sharp))), // HP
                                  // Obx(() => IconButton(
                                  //     onPressed: () {},
                                  //     icon: const Icon(
                                  //         Icons.keyboard_double_arrow_up_sharp))), // DMG
                                  // Obx(() => IconButton(
                                  //     onPressed: () {},
                                  //     icon: const Icon(
                                  //         Icons.keyboard_double_arrow_up_sharp))), // DEF
                                  // Obx(() => statsText('100')), // EXP
                                ]
                              : <Widget>[
                                  statsUpButton(() {}, null, Colors.transparent,
                                      Colors.yellow[800]!),
                                  statsUpButton(() {}, null, Colors.transparent,
                                      Colors.yellow[800]!),
                                  statsUpButton(() {}, null, Colors.transparent,
                                      Colors.yellow[800]!),
                                  statsText(
                                      playerController.nextLevelExp.value
                                          .toString(),
                                      null),
                                ]),
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Skill Points Left:'),
                  const SizedBox(
                    width: 10,
                  ),
                  Obx(() => Text('${playerController.skillUpPoints.value}')),
                ],
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     const Text('Character Level:'),
              //     const SizedBox(
              //       width: 10,
              //     ),
              //     Obx(() => Text('${playerController.playerLevel.value}')),
              //   ],
              // ),
            ],
          )),
        ],
      ),
    );
  }
}
