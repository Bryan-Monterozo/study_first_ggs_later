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
          Expanded(
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
                                'HP: ${playerController.playerHealth.value}'),
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
          Expanded(
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
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        statsText(' HP'),
                        statsText('DMG'),
                        statsText('DEF'),
                        statsText('EXP'),
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(() => statsText(
                            playerController.playerHealth.value.toString())),
                        Obx(() => statsText(
                            playerController.playerDamage.value.toString())),
                        Obx(() => statsText(
                            playerController.playerDefense.value.toString())),
                        Obx(() => statsText(
                            playerController.playerExp.value.toString())),
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        statsUpButton(() {}, null ,Colors.transparent, Colors.yellow[800]!),
                        statsUpButton(() {}, null, Colors.transparent, Colors.yellow[800]!),
                        statsUpButton(() {}, Colors.yellow, Colors.yellow[600]!, Colors.white),
                        statsText('100'),
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
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
