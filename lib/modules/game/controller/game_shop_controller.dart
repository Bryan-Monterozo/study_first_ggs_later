import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_equip_controller.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_inv_controller.dart';

class PlayerShopController extends GetxController {
  //SERVICES
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //VARIABLES
  //Items
  RxInt apple = 0.obs; // 1
  RxInt smallPot = 0.obs; // 2
  RxInt mediumPot = 0.obs; // 3
  RxInt largePot = 0.obs; // 4

  //Equipment
  RxInt woodenSword = 0.obs; // 5
  RxInt leatherTunic = 0.obs; // 6
  RxInt woodenShield = 0.obs; // 7
  
  //Methods

  @override
  void onInit() async {
    super.onInit();
    await initShop();
  }

  initShop() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // final ref = await firestore.collection('Shop').doc().get();
    if (prefs.getBool('shopLoaded') == null) {
      await prefs.setBool('shopLoaded', false);
      initShop();
    } else {
      if (prefs.getBool('shopLoaded') == false) {
        fetchShopFromDB();
        print('shop db');
      } else {
        fetchCurrentShop();
        print('shop prefs');
      }
    }
  }

  fetchShopFromDB() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // final ref = await firestore.collection('Shop').doc().get();
    QuerySnapshot ref = await firestore.collection('Shop').get();
    // ignore: avoid_function_literals_in_foreach_calls
    ref.docs.forEach((docs) async {
      var x = (int.parse(docs['itemId']) + 200).toString();
      await prefs.setInt(x, docs['itemPrice']);
    });

    // price data denoted by 200's

    await prefs.setBool('shopLoaded', true);
    apple.value = prefs.getInt('201')!;
    smallPot.value = prefs.getInt('202')!;
    mediumPot.value = prefs.getInt('203')!;
    largePot.value = prefs.getInt('204')!;
    woodenSword.value = prefs.getInt('205')!;
    leatherTunic.value = prefs.getInt('206')!;
    woodenShield.value = prefs.getInt('207')!;
  }

  fetchCurrentShop() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('shopLoaded', true);
    apple.value = prefs.getInt('201')!;
    smallPot.value = prefs.getInt('202')!;
    mediumPot.value = prefs.getInt('203')!;
    largePot.value = prefs.getInt('204')!;
    woodenSword.value = prefs.getInt('205')!;
    leatherTunic.value = prefs.getInt('206')!;
    woodenShield.value = prefs.getInt('207')!;
  }

  buyItem(int buy) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (buy) {
      case 1:
        // await FirebaseFirestore.instance
        //     .collection('Shop')
        //     .doc('ShopItems')
        //     .update({
        //   'airCount': FieldValue.increment(1),
        // });
        await prefs.setInt('apple', prefs.getInt('apple')! + 1);
        Get.find<PlayerInvController>().appleCount.value =
            prefs.getInt('apple')!;
        break;
      case 2:
        await prefs.setInt('smallPot', prefs.getInt('smallPot')! + 1);
        Get.find<PlayerInvController>().smallPotCount.value =
            prefs.getInt('smallPot')!;
        break;
      case 3:
        break;
      default:
        null;
        break;
    }
  }
  buyEquipment(int buy) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (buy) {
      case 5:
        if (Get.find<PlayerEquipController>().woodenSword.value == 0) {
          await prefs.setInt('105', 1);
          Get.find<PlayerEquipController>().woodenSword.value = 1;
        }
        break;
      case 6:
        if (Get.find<PlayerEquipController>().leatherTunic.value == 0) {
          await prefs.setInt('106', 1);
          Get.find<PlayerEquipController>().leatherTunic.value = 1;
        }
        break;  
      case 7:
        if (Get.find<PlayerEquipController>().woodenShield.value == 0) {
          await prefs.setInt('107', 1);
          Get.find<PlayerEquipController>().woodenShield.value = 1;
        }
        break;
      default:
        null;
        break;
    }
  }
}

class ShopPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // controller
  late TabController tabController;
  // late PageController pageController;
  // int selectedIndex = 0;

  @override
  void onInit() async {
    super.onInit();
    // pageController = PageController(initialPage: 0);
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void onClose() {
    tabController.dispose();
    // pageController.dispose();
    super.onClose();
  }

  // onPageChanged(int index) {
  //   selectedIndex = index;
  // }
}
