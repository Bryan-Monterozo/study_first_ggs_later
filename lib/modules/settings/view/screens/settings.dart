// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/core/constants/route.dart';
import 'package:study_first_ggs_later/modules/home/view/screens/home.dart';
import 'package:study_first_ggs_later/modules/settings/view/screens/edit_profile.dart';
import 'package:study_first_ggs_later/modules/settings/view/widgets/settings_content2.dart';
import 'package:study_first_ggs_later/modules/settings/view/widgets/settings_item.dart';
import 'package:study_first_ggs_later/modules/shared/controller/nav_controller.dart';

import 'package:study_first_ggs_later/modules/settings/view/widgets/settings_premium_card.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';

import 'package:study_first_ggs_later/modules/settings/view/widgets/settings_item.dart';
import 'package:study_first_ggs_later/modules/settings/view/widgets/settings_content2.dart';

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
      backgroundColor: Colors.white,
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
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            StickyHeader(
              header: const PremiumCardGesture(
                //Premium Card (In App Purchase)
                premNavigator: StudyHome(), //placeholder for now
                premContainer: PremiumCard(
                  colorNotes: Color(0xFF0B6BA7),
                  cardColor: Colors.white,
                  icons: Icons.workspace_premium_rounded,
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    const SettingsTitle(
                      title: "Account",
                      icons: Icons.person,
                    ),
                    SettingsItem(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfilePage(),
                          ),
                        );
                      },
                      name: "Edit Profile",
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "Forgot Password",
                    ),
                    const SettingsTitle(
                      icons: Icons.settings,
                      title: "General",
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "Always Screen ON/OFF",
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "Vibration",
                    ),
                    const SettingsTitle(
                      icons: Icons.notifications,
                      title: "Notifications",
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "Daily Reminder",
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "Sound Effects",
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "Countdown Notification",
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "Reminder Sound",
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "Reminder Vibration",
                    ),
                    const SettingsTitle(
                      icons: Icons.color_lens,
                      title: "Other",
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "Theme",
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "Connect only to Wi-Fi",
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
                      ),
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "Automatically Send Usage and Crash Reports",
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
                      ),
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "About",
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "Privacy Policy",
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "Terms of Service",
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "Rate Us",
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "Share",
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "Feedback",
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "FAQ",
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "Help",
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "Contact Us",
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "Version",
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "Licenses",
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "Open Source Libraries",
                    ),
                    const SettingsTitle(
                      icons: Icons.security,
                      title: "Security",
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "Change Password",
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "Change Email",
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "Delete Account",
                    ),
                    SettingsItem(
                      onTap: () {},
                      name: "Sign Out",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
