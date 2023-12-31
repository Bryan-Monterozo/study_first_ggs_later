// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_shop_controller.dart';

class ShopItemCard extends StatelessWidget {
  final String itemName;
  final int itemCount;
  final int itemId;
  final int itemPrice;
  const ShopItemCard({
    Key? key,
    required this.itemName,
    required this.itemCount,
    required this.itemId,
    required this.itemPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.defaultDialog(
            title: 'Buy Item',
            middleText: 'Are you sure you want to buy $itemName?',
            confirm: ElevatedButton(
              onPressed: () async {
                Get.find<PlayerShopController>().buyItem(itemId);
                Get.back();
              },
              child: const Text('OK'),
            ),
            cancel: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Cancel')));
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
              itemName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'In Inventory: $itemCount',
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            Text(
              'Price: $itemPrice',
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
