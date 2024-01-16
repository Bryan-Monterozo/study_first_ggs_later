import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_inv_controller.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_shop_controller.dart';
import 'package:study_first_ggs_later/modules/game/view/widgets/shop_item_card.dart';

class GameItemShopPage extends StatelessWidget {
  const GameItemShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // reinitialize controllers
    Get.delete<PlayerInvController>();
    Get.delete<PlayerShopController>();
    PlayerInvController playerItemController = Get.put(PlayerInvController());
    // ignore: unused_local_variable
    PlayerShopController playerShopController =
        Get.put(PlayerShopController());
    return Container(
        color: Colors.blue[300],
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => GridView(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 220,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 5,
                  ),
                  children: [
                    ShopItemCard(
                        itemName: 'Apple',
                        itemCount: playerItemController.appleCount.value,
                        itemId: 1,
                        itemPrice: playerShopController.apple.value),
                    ShopItemCard(
                        itemName: 'Small Potion',
                        itemCount: playerItemController.smallPotCount.value,
                        itemId: 2,
                        itemPrice: playerShopController.smallPot.value),
                    ShopItemCard(
                        itemName: 'Medium Potion',
                        itemCount: 0,
                        itemId: 3,
                        itemPrice: playerShopController.mediumPot.value),
                    ShopItemCard(
                        itemName: 'Large Potion',
                        itemCount: 0,
                        itemId: 4,
                        itemPrice: playerShopController.largePot.value),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
