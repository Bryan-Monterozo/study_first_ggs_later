import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_inv_controller.dart';
import 'package:study_first_ggs_later/modules/game/view/widgets/item_card.dart';

class GameInventoryPage extends StatelessWidget {
  const GameInventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // reinitialize controllers
    Get.delete<PlayerInvController>();
    // Get.delete<PlayerController>();
    // Get.delete<EnemyController>();
    // Get.delete<BattleController>();
    PlayerInvController playerInvController = Get.put(PlayerInvController());
    // PlayerController playerController = Get.put(PlayerController());
    // EnemyController enemyController = Get.put(EnemyController());
    // BattleController battleController = Get.put(BattleController());

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
                    mainAxisSpacing: 20,
                  ),
                  children: [
                    if (playerInvController.airCount.value > 0)
                      ItemCard(
                        itemName: 'Air',
                        itemCount: playerInvController.airCount.value,
                        itemId: 0,
                      ),
                    if (playerInvController.appleCount.value > 0)
                      ItemCard(
                        itemName: 'Apple',
                        itemCount: playerInvController.appleCount.value,
                        itemId: 1,
                      ),
                    if (playerInvController.smallPotCount.value > 0)
                      ItemCard(
                        itemName: 'Small Potion',
                        itemCount: playerInvController.smallPotCount.value,
                        itemId: 2,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
