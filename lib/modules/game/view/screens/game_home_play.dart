import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/core/constants/route.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_get_controller.dart';
import 'package:study_first_ggs_later/modules/game/view/screens/game_battle.dart';
import 'package:study_first_ggs_later/modules/game/view/screens/game_inventory.dart';
import 'package:study_first_ggs_later/modules/game/view/screens/game_shop.dart';
import 'package:study_first_ggs_later/modules/game/view/screens/game_stats.dart';
import 'package:study_first_ggs_later/modules/game/view/widgets/bottom_navbar.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/shared/controller/loading_controller.dart';
import 'package:study_first_ggs_later/modules/shared/controller/nav_controller.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';

class GameHomePlay extends StatelessWidget {
  const GameHomePlay({super.key});

  @override
  Widget build(BuildContext context) {
    GamePageController gamePageController = Get.put(GamePageController());
    Get.delete<NavController>();
    Get.delete<LoadingController>();
    NavController navController = Get.put(NavController());
    LoadingController loadingController = Get.put(LoadingController());
    navController.initNav(
      currentRoute: CurrentRoute.game,
    );
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: const SharedAppBar(
        title: 'Game',
      ),
      bottomNavigationBar: GetBuilder<GamePageController>(
          // ignore: prefer_const_constructors
          builder: (controller) => GameButtonNavBar()
        ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.91,
        child: PageView(
          controller: gamePageController.pageController,
          onPageChanged: (index) {
            gamePageController.onPageChanged(index);
          },
          children: const [
            GameBattlePage(),
            GameSatsPage(),
            GameInventoryPage(),
            GameShopPage(),
          ],
        ),
      ),
    );
  }
}
