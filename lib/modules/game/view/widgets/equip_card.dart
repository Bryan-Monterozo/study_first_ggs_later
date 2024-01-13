// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_equip_controller.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_inv_controller.dart';

class EquipCard extends StatelessWidget {
  final String equipName;
  final int equipState;
  final int itemId;
  const EquipCard({
    Key? key,
    required this.equipName,
    required this.equipState,
    required this.itemId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        equipState == 1
            ? Get.defaultDialog(
                title: 'Equip Gear',
                middleText: 'Are you sure you want to equip $equipName?',
                confirm: ElevatedButton(
                  onPressed: () async {
                    Get.find<PlayerEquipController>().equipGear(itemId);
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
          children: [
            Text(
              equipName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            equipState == 1
                ? Text(
                    'Equip $equipName',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                    ),
                  )
                : const Text(
                    'Equipped',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.green,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
