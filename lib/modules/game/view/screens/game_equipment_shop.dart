import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_equip_controller.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_inv_controller.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_shop_controller.dart';
import 'package:study_first_ggs_later/modules/game/view/widgets/shop_equip_card.dart';
import 'package:study_first_ggs_later/modules/game/view/widgets/shop_item_card.dart';

class GameEquipmentShopPage extends StatelessWidget {
  const GameEquipmentShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // reinitialize controllers
    Get.delete<PlayerShopController>();
    Get.delete<PlayerEquipController>();
    PlayerEquipController playerEquipController =
        Get.put(PlayerEquipController());
    // ignore: unused_local_variable
    PlayerShopController playerShopController = Get.put(PlayerShopController());
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
                    ShopEquipCard(
                      equipName: 'Wooden Sword',
                      itemId: 5,
                      itemPrice: playerShopController.woodenSword.value,
                      equipState: playerEquipController.woodenSword.value,
                    ),
                    ShopEquipCard(
                      equipName: 'Leather Tunic',
                      itemId: 6,
                      itemPrice: playerShopController.leatherTunic.value,
                      equipState: playerEquipController.leatherTunic.value,
                    ),
                    ShopEquipCard(
                      equipName: 'Wooden Shield',
                      itemId: 7,
                      itemPrice: playerShopController.woodenShield.value,
                      equipState: playerEquipController.woodenShield.value,
                    ),
                    // const ShopItemCard(
                    //     itemName: 'Large Potion',
                    //     itemCount: 0,
                    //     itemId: 4,
                    //     itemPrice: 1000),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
