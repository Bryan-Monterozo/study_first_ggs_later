import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_first_ggs_later/modules/game/controller/game_inv_controller.dart';

class PlayerShopController extends GetxController {
  //SERVICES
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //VARIABLES
  RxInt apple = 0.obs;
  RxInt smallPot = 0.obs;
  RxInt mediumPot = 0.obs;
  RxInt largePot = 0.obs;

  //Methods

  @override
  void onInit() async {
    super.onInit();
    await initShop();
  }

  initShop() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final ref = await firestore.collection('Shop').doc().get();
    if (ref.exists) {
      if (prefs.getBool('shopLoaded') == null) {
        await prefs.setBool('shopLoaded', false);
        initShop();
      } else {
        if (prefs.getBool('shopLoaded') == false) {
          await fetchShopFromDB();
          print('shop db');
        } else {
          await fetchCurrentShop();
          print('shop prefs');
        }
      }
    }
  }

  fetchShopFromDB() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final ref = await firestore.collection('Shop').doc().get();
    for (var i = 1; i < ref.data()!.length; i++) {
      final docRef = await firestore.collection('Shop').doc(i.toString()).get();
      await prefs.setInt(docRef['itemId'], docRef['itemPrice']);
    }
    await prefs.setBool('shopLoaded', true);
    apple.value = prefs.getInt('1')!;
    smallPot.value = prefs.getInt('2')!;
    mediumPot.value = prefs.getInt('3')!;
    largePot.value = prefs.getInt('4')!;
  }

  fetchCurrentShop() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('shopLoaded', true);
    apple.value = prefs.getInt('1')!;
    smallPot.value = prefs.getInt('2')!;
    mediumPot.value = prefs.getInt('3')!;
    largePot.value = prefs.getInt('4')!;
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
        Get.find<PlayerInvController>().appleCount.value = prefs.getInt('apple')!;
        break;
      case 2:
        await prefs.setInt('smallPot', prefs.getInt('smallPot')! + 1);
        Get.find<PlayerInvController>().smallPotCount.value = prefs.getInt('smallPot')!;
        break;
      case 3:
        break;
      default:
        null;
        break;
    }
  }
}
