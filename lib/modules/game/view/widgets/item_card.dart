// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_inv_controller.dart';

class ItemCard extends StatelessWidget {
  final String itemName;
  final int itemCount;
  final int itemId;
  const ItemCard({
    Key? key,
    required this.itemName,
    required this.itemCount,
    required this.itemId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.defaultDialog(
            title: 'Use Item',
            middleText: 'Are you sure you want to use $itemName?',
            confirm: ElevatedButton(
              onPressed: () async {
                Get.find<PlayerInvController>().useItem(itemId);
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
          children: [
            Text(
              itemName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Count: $itemCount',
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
