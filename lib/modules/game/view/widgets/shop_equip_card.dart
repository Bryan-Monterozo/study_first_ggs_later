// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:study_first_ggs_later/modules/game/controller/game_shop_controller.dart';

class ShopEquipCard extends StatelessWidget {
  final String equipName;
  final int itemId;
  final int itemPrice;
  final int equipState;
  const ShopEquipCard({
    Key? key,
    required this.equipName,
    required this.itemId,
    required this.itemPrice,
    required this.equipState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        equipState == 0
            ? Get.defaultDialog(
                title: 'Buy Equipment',
                middleText: 'Are you sure you want to buy $equipName?',
                confirm: ElevatedButton(
                  onPressed: () async {
                    Get.find<PlayerShopController>().buyEquipment(itemId);
                    Get.back();
                  },
                  child: const Text('OK'),
                ),
                cancel: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Cancel')))
            : null;
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              equipName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Text(
            //   'In Inventory: $itemCount',
            //   style: const TextStyle(
            //     fontSize: 15,
            //   ),
            // ),
            equipState == 0
                ? Text(
                    'Price: $itemPrice',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  )
                : const Text(
                    'Bought',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
