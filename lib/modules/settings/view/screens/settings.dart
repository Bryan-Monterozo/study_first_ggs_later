// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/core/constants/route.dart';
import 'package:study_first_ggs_later/modules/shared/controller/nav_controller.dart';

import 'package:flutter/cupertino.dart';

import 'package:study_first_ggs_later/modules/settings/view/widgets/settings_user_card.dart';
import 'package:study_first_ggs_later/modules/settings/view/widgets/settings_icon_style.dart';
import 'package:study_first_ggs_later/modules/settings/view/widgets/settings_item.dart';
import 'package:study_first_ggs_later/modules/settings/view/widgets/settings_group.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';

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
        // leading: Builder(
        //   builder: (BuildContext context) {
        //     return IconButton(
        //       icon: const Icon(Icons.menu),
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //     );
        //   },
        // ),

        // IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: const Icon(Icons.close_rounded),
        //   color: Colors.white,
        // ),

        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            // User card
            UserCard(
              cardColor: Colors.blue.withOpacity(0.3),
              cardActionWidget: SettingsItem(
                icons: Icons.workspace_premium_rounded,
                iconStyle: IconStyle(
                  iconsColor: Colors.white,
                  backgroundColor: Colors.white.withOpacity(0.3),
                ),
                subtitle: "More info >>",
                onTap: () {
                  print("In App purchase");
                },
              ),
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
                SettingsItem(
                  onTap: () {},
                  icons: Icons.notifications_rounded,
                  title: 'Sound',
                  subtitle: "Sound Notification on session finished",
                  trailing: Switch.adaptive(
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.vibration_rounded,
                  title: 'Vibration',
                  subtitle: "Vibration on session finish",
                  trailing: Switch.adaptive(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.notifications_rounded,
                  title: 'Always Screen ON/OFF',
                  subtitle: "Screen will always be ON during the session",
                  trailing: Switch.adaptive(
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.info_rounded,
                  title: 'About',
                  subtitle: "Learn more about Study First, GGS Later",
                ),
              ],
            ),
            SettingsGroup(
              settingsGroupTitle: "Others",
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.flag_circle_fill,
                  title: "Change Language",
                  subtitle: "English",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.wifi_rounded,
                  title: 'Connect Only on Wi-Fi',
                  trailing: Switch.adaptive(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
                 SettingsItem(
                  onTap: () {},
                  icons: Icons.report_rounded,
                  title: 'Automatically Send Usage and Crash Reports',
                  trailing: Switch.adaptive(
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            // You can add a settings title
            SettingsGroup(
              settingsGroupTitle: "Account",
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.repeat,
                  title: "Change email",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.delete_solid,
                  title: "Delete account",
                  titleStyle: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.exit_to_app_rounded,
                  title: "Sign Out",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
