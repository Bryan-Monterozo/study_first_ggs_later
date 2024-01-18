import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_get_controller.dart';

class PlayerInvController extends GetxController {
  //SERVICES
  final firestore = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser!.uid;

  //VARIABLES
  RxInt airCount = 0.obs;
  RxInt appleCount = 0.obs;
  RxInt smallPotCount = 0.obs;
  RxInt itemCount = 0.obs;

  // Methods

  @override
  void onInit() async {
    super.onInit();
    await initInventory();
  }

  initInventory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('hasInv') == null) {
      final ref = await firestore
          .collection('Users')
          .doc(uid)
          .collection('Player')
          .doc('Inventory')
          .get();
      if (ref.exists) {
        await prefs.setBool('hasInv', false);
        initInventory();
        prefs.setInt('totalBattlePoints', 0);
      } else {
        await createNewPlayerInv();
        initInventory();
      }
    } else {
      if (prefs.getBool('hasInv') == false) {
        // Get.find<BattleController>().initBattleSystem();
        fetchItemFromDB();
      } else {
        fetchCurrentItem();
        print(prefs.getBool('hasInv'));
      }
    }
  }

  createNewPlayerInv() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final ref = firestore
        .collection('Users')
        .doc(uid)
        .collection('Player')
        .doc('Inventory');
    await ref.set({
      'InventoryId': uid,
    });
    final collection = firestore
        .collection('Users')
        .doc(uid)
        .collection('Player')
        .doc('Inventory')
        .collection('Items')
        .doc('Item1');
    await collection.set({
      '0': 0, //air
      '1': 5, //apple
      '2': 0, //smallPot
    });
    await prefs.setBool('hasInv', false);
  }

  fetchItemFromDB() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final collection = firestore
        .collection('Users')
        .doc(uid)
        .collection('Player')
        .doc('Inventory')
        .collection('Items')
        .doc('Item1');
    await collection.get().then((val) async {
      airCount.value = val['0'];
      appleCount.value = val['1'];
      smallPotCount.value = val['2'];
    });
    await prefs.setBool('hasInv', true);
    await prefs.setInt('air', airCount.value);
    await prefs.setInt('apple', appleCount.value);
    await prefs.setInt('smallPot', smallPotCount.value);
  }

  fetchCurrentItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasImv', true);
    airCount.value = prefs.getInt('air')!;
    appleCount.value = prefs.getInt('apple')!;
    smallPotCount.value = prefs.getInt('smallPot')!;
  }

  useItem(int item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (item) {
      case 0: //air
        if (prefs.getInt('air')! > 0) {
          null;
        }
        break;
      case 1: //apple (+10 hp)
        if (prefs.getInt('apple')! > 0) {
          healPlayer(10);
          await prefs.setInt('apple', prefs.getInt('apple')! - 1);
          appleCount.value = prefs.getInt('apple')!;
        }
        break;
      case 2: //nothing
        if (prefs.getInt('smallPot')! > 0) {
          healPlayer(25);
          await prefs.setInt('smallPot', prefs.getInt('smallPot')! - 1);
          smallPotCount.value = prefs.getInt('smallPot')!;
        }
        break;
      default: //nothing
        null;
    }
  }

  healPlayer(int heal) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int currentHealth = prefs.getInt('playerTotalHealth')!;
    int baseHealth =
        prefs.getInt('playerHealth')! + prefs.getInt('equipHealth')!;
    if (currentHealth < baseHealth) {
      if (currentHealth + heal >= baseHealth) {
        await prefs.setInt('playerTotalHealth', baseHealth);
      } else {
        await prefs.setInt('playerTotalHealth', currentHealth + heal);
      }
    }
    Get.find<PlayerController>().playerTotalHealth.value =
        prefs.getInt('playerTotalHealth')!;
  }

  getItemCount(int item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (item) {
      case 0: //air
        prefs.getInt('air');
        break;
      // return prefs.getInt('air');
      case 1: //apple
        prefs.getInt('apple');
        itemCount.value = prefs.getInt('apple')!;
        break;
      case 2: //smallPot
        prefs.getInt('smallPot');
        itemCount.value = prefs.getInt('smallPot')!;
        break;
      default:
        return 0;
    }
  }
}

class InvPageController extends GetxController
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
