// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/core/constants/route.dart';
import 'package:study_first_ggs_later/modules/home/view/screens/home.dart';
import 'package:study_first_ggs_later/modules/settings/view/widgets/settings_group.dart';
import 'package:study_first_ggs_later/modules/settings/view/widgets/settings_item.dart';
import 'package:study_first_ggs_later/modules/shared/controller/nav_controller.dart';

import 'package:study_first_ggs_later/modules/settings/view/widgets/settings_premium_card.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';


import 'package:sticky_headers/sticky_headers.dart';

class StudySettings extends StatelessWidget {
  static String routeName = '/settings';
  final NavController navController = Get.put(NavController());
  StudySettings({super.key});

  @override
  Widget build(BuildContext context) {
    navController.initNav(
      currentRoute: CurrentRoute.home,
    );
    return Scaffold(
      backgroundColor: Colors.grey,
      drawer: const NavDrawer(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 39, 66, 85),
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            StickyHeader(
              header:
              const PremiumCardGesture( //Premium Card (In App Purchase)
                premNavigator: StudyHome(), //placeholder for now
                premContainer: PremiumCard(
                      colorNotes: Color(0xFF0B6BA7), 
                      cardColor: Colors.white, 
                      cardModel: null, 
                      icons: Icons.workspace_premium_rounded,
                      ),
                      ),  
                        
              content:
              SingleChildScrollView(child: Column(children: [
                SettingsGroup(
                        settingsGroupTitle: "General",
                        items: [
                          SettingsItem(
                            onTap: () {},
                            icons: Icons.fingerprint,
                            title: 'Privacy',
                            subtitle: "Lock Study First to improve your privacy",
                          ),
                          SettingsItem(
                            onTap: () {},
                            icons: Icons.dark_mode_rounded,
                            title: 'Dark mode',
                            subtitle: "Automatic",
                            trailing: Switch.adaptive(
                              value: false,
                              onChanged: (value) {},
                            ),
                          ),                       
                        ],
                      ),
                      SettingsGroup(
                        settingsGroupTitle: "General",
                        items: [
                          SettingsItem(
                            onTap: () {},
                            icons: Icons.fingerprint,
                            title: 'Privacy',
                            subtitle: "Lock Study First to improve your privacy",
                          ),                              
                        ],
                      ),   
              ]
              ),
              )     
            ),
          ],
        ),
      ),
    );
  }
}