import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_shop_controller.dart';
import 'package:study_first_ggs_later/modules/game/view/screens/game_equipment_shop.dart';
import 'package:study_first_ggs_later/modules/game/view/screens/game_item_shop.dart';

class GameShopPage extends StatelessWidget {
  const GameShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    ShopPageController shopPageController = Get.put(ShopPageController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: Card(
          // elevation: 26.0,
          color: Colors.white,
          child: TabBar(
            controller: shopPageController.tabController,
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
          controller: shopPageController.tabController,
          // onPageChanged: (index) {
          //   invPageController.onPageChanged(index);
          // },
          children: const [
            GameItemShopPage(),
            GameEquipmentShopPage(),
          ],
        ),
      ),
    );
  }
}
