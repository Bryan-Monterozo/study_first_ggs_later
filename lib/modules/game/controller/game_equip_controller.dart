import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayerEquipController extends GetxController {
  //SERVICES
  final firestore = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser!.uid;

  //VARIABLES
  RxInt woodenSword = 0.obs;
  RxInt leatherTunic = 0.obs;
  RxInt woodenShield = 0.obs;

  // Methods

  @override
  void onInit() async {
    super.onInit();
    await initEquipment();
  }

  initEquipment() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('hasEquip') == null) {
      final ref = await firestore
          .collection('Users')
          .doc(uid)
          .collection('Player')
          .doc('Inventory')
          .collection('Equipment')
          .doc('Equip1')
          .get();
      if (ref.exists) {
        await prefs.setBool('hasEquip', false);
        initEquipment();
        // prefs.setInt('totalBattlePoints', 0);
      } else {
        await createNewPlayerEquip();
        initEquipment();
      }
    } else {
      if (prefs.getBool('hasEquip') == false) {
        // Get.find<BattleController>().initBattleSystem();
        fetchEquipFromDB();
        print('from db');
      } else {
        fetchCurrentEquip();
        print(prefs.getBool('hasEquip'));
      }
    }
  }

  createNewPlayerEquip() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final collection = firestore
        .collection('Users')
        .doc(uid)
        .collection('Player')
        .doc('Inventory')
        .collection('Equipment')
        .doc('Equip1');
    await collection.set({
      '0': 0, // itemId: 5 woodenSword
      '1': 0, // itemId: 6 leatherTunic
      '2': 0, // itemId: 7 woodenShield
    });
    await prefs.setBool('hasEquip', false);
  }

  fetchEquipFromDB() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final collection = firestore
        .collection('Users')
        .doc(uid)
        .collection('Player')
        .doc('Inventory')
        .collection('Equipment')
        .doc('Equip1');
    await collection.get().then((val) async {
      woodenSword.value = val['0'];
      leatherTunic.value = val['1'];
      woodenShield.value = val['2'];
    });

    // equipment data denoted by 100's
    await prefs.setBool('hasEquip', true);
    await prefs.setInt('105', woodenSword.value); // woodenSword
    await prefs.setInt('106', leatherTunic.value); // leatherTunic
    await prefs.setInt('107', woodenShield.value); // woodenShield
  }

  fetchCurrentEquip() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasEquip', true);
    woodenSword.value = prefs.getInt('105')!;
    leatherTunic.value = prefs.getInt('106')!;
    woodenShield.value = prefs.getInt('107')!;
    print(woodenSword.value.toString());
  }

  equipGear(int equip) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //equipment data denoted by 100's

    for (var i = 5; i <= 7; i++) {
      var x = (i + 100).toString();
      var y = prefs.getInt(x);
      if (y == 2) {
        await prefs.setInt(x, 1);
      }
    }
    woodenSword.value = prefs.getInt('105')!;
    leatherTunic.value = prefs.getInt('106')!;
    woodenShield.value = prefs.getInt('107')!;
    prefs.setInt('equipHealth', 0);
    prefs.setInt('equipDamage', 0);
    prefs.setInt('equipDefense', 0);
    switch (equip) {
      case 5:
        await prefs.setInt('105', 2);
        woodenSword.value = prefs.getInt('105')!;
        prefs.setInt('equipDamage', 3);
        print(woodenSword.value.toString());
        break;
      case 6:
        await prefs.setInt('106', 2);
        prefs.setInt('equipHealth', 10);
        leatherTunic.value = prefs.getInt('106')!;
        await prefs.setInt('playerTotalHealth', prefs.getInt('playerHealth')! + prefs.getInt('equipHealth')!);
        break;
      case 7:
        await prefs.setInt('107', 2);
        prefs.setInt('equipDefense', 3);
        woodenShield.value = prefs.getInt('107')!;
        break;
    }
  }
}
