import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_equip_controller.dart';
import 'package:study_first_ggs_later/modules/game/view/widgets/equip_card.dart';
import 'package:study_first_ggs_later/modules/game/view/widgets/item_card.dart';

class GameEquipmentPage extends StatelessWidget {
  const GameEquipmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    // reinitialize controllers
    Get.delete<PlayerEquipController>();
    PlayerEquipController playerEquipController = Get.put(PlayerEquipController());
    return Container(
        color: Colors.blue[300],
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Obx(
                  () => GridView(
                    // scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(20),
                    
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount (
                      // maxCrossAxisExtent: 100,
                      // mainAxisExtent: 100,
                      crossAxisCount: 3,
                      childAspectRatio: 2 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    children: [
                      if (playerEquipController.woodenSword.value > -1)
                        ItemCard(
                          itemName: 'Air',
                          itemCount: 0,
                          itemId: 0,
                        ),
                      if (playerEquipController.woodenSword.value > -1)
                        ItemCard(
                          itemName: 'Apple',
                          itemCount: 0,
                          itemId: 1,
                        ),
                      if (playerEquipController.woodenSword.value > -1)
                        ItemCard(
                          itemName: 'Small Potion',
                          itemCount: 0,
                          itemId: 2,
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
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
                    if (playerEquipController.woodenSword.value > 0)
                      EquipCard(
                        equipName: 'Wooden Sword',
                        equipState: playerEquipController.woodenSword.value,
                        itemId: 5,
                      ),
                    if (playerEquipController.leatherTunic.value > 0)
                      EquipCard(
                        equipName: 'Leather Tunic',
                        equipState: playerEquipController.leatherTunic.value,
                        itemId: 6,
                      ),
                    if (playerEquipController.woodenShield.value > 0)
                      EquipCard(
                        equipName: 'Wooden Shield',
                        equipState: playerEquipController.woodenShield.value,
                        itemId: 7,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
