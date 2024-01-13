import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_inv_controller.dart';
import 'package:study_first_ggs_later/modules/game/view/screens/game_equipment.dart';
import 'package:study_first_ggs_later/modules/game/view/screens/game_items.dart';

class GameInventoryPage extends StatelessWidget {
  const GameInventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    InvPageController invPageController = Get.put(InvPageController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: Card(
          // elevation: 26.0,
          color: Colors.white,
          child: TabBar(
            controller: invPageController.tabController,
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey[600],
            tabs: const <Tab>[
              Tab(
                child: Text('Items'),
              ),
              Tab(
                child: Text('Equipment'),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        // height: MediaQuery.of(context).size.height * 0.91,
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: invPageController.tabController,
          // onPageChanged: (index) {
          //   invPageController.onPageChanged(index);
          // },
          children: const [
            GameItemPage(),
            GameEquipmentPage(),
          ],
        ),
      ),
    );
  }
}
