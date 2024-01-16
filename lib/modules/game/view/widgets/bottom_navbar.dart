import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/core/icons/custom_game_icons.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_get_controller.dart';

class GameButtonNavBar extends StatelessWidget {
  const GameButtonNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // backgroundColor: Colors.blue[300],
      unselectedItemColor: Colors.grey[600],
      fixedColor: Colors.blue[300],
      currentIndex: Get.find<GamePageController>().selectedIndex,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(CustomGameIcons.sword_cross), label: 'Battle'),
        BottomNavigationBarItem(
            icon: Icon(CustomGameIcons.account), label: 'Character'),
        BottomNavigationBarItem(
            icon: Icon(CustomGameIcons.treasure_chest), label: 'Inventory'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Shop'),
      ],
      onTap: (index) {
        Get.find<GamePageController>().pageController.animateToPage(index,
            duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
      },
    );
  }
}
