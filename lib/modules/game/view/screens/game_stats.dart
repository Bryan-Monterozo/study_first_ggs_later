import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_get_controller.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_sprite.dart';
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          //player show box
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
                                width: MediaQuery.of(context).size.width * 0.20,
                                child: LinearPercentIndicator(
                                  width:
                                      MediaQuery.of(context).size.width * 0.20,
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
                        ],
                      )),
                ),
              ),
            ),
          ]),
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
                  Text(
                    'Character Name:',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Obx(
                    () => Text(
                      playerController.playerName.value,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Character Level:',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Obx(() => Text(
                        '${playerController.playerLevel.value}',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ],
          )),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.05,
          // ),
          //player stats
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              height: MediaQuery.of(context).size.height * 0.45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        statsText(' HP', null,
                            MediaQuery.of(context).size.width * 0.05),
                        statsText('DMG', null,
                            MediaQuery.of(context).size.width * 0.05),
                        statsText('DEF', null,
                            MediaQuery.of(context).size.width * 0.05),
                        statsText('EXP', null,
                            MediaQuery.of(context).size.width * 0.05),
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(() => statsText(
                            playerController.playerHealth.value.toString(),
                            playerController.equipHealth.value.toString(),
                            MediaQuery.of(context).size.width * 0.05)),
                        Obx(() => statsText(
                            playerController.playerDamage.value.toString(),
                            playerController.equipDamage.value.toString(),
                            MediaQuery.of(context).size.width * 0.05)),
                        Obx(() => statsText(
                            playerController.playerDefense.value.toString(),
                            playerController.equipDefense.value.toString(),
                            MediaQuery.of(context).size.width * 0.05)),
                        Obx(() => statsText(
                            playerController.playerExp.value.toString(),
                            null,
                            MediaQuery.of(context).size.width * 0.05)),
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
                      height: MediaQuery.of(context).size.height * 0.4,
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
                                  }, Colors.yellow, Colors.yellow[600]!,
                                      Colors.white),
                                  statsUpButton(() {
                                    playerController.upgradeStat(3);
                                  }, Colors.yellow, Colors.yellow[600]!,
                                      Colors.white),
                                  statsText(
                                      playerController.nextLevelExp.value
                                          .toString(),
                                      null,
                                      MediaQuery.of(context).size.width * 0.05),
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
                                      null,
                                      MediaQuery.of(context).size.width * 0.05),
                                ]),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Expanded(
              child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.35,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Skill Points Left:',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Obx(() => Text(
                          '${playerController.skillUpPoints.value}',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              fontWeight: FontWeight.bold),
                        )),
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
            ),
          )),
        ],
      ),
    );
  }
}
