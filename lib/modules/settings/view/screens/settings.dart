// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_first_ggs_later/core/constants/route.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/shared/controller/nav_controller.dart';

// import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:study_first_ggs_later/modules/settings/view/widgets/settings_user_card.dart';
import 'package:study_first_ggs_later/modules/settings/view/widgets/settings_icon_style.dart';
import 'package:study_first_ggs_later/modules/settings/view/widgets/settings_item.dart';
import 'package:study_first_ggs_later/modules/settings/view/widgets/settings_group.dart';

class StudySettings extends StatelessWidget {
  static const String routeName = '/settings';
  final NavController navController = Get.put(NavController());
  StudySettings({super.key});

  @override
  Widget build(BuildContext context) {
    navController.initNav(
      currentRoute: CurrentRoute.settings,
    );
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 218, 218, 218).withOpacity(.94),
      appBar: AppBar(
        leading: leadingBack(context),
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            // User card
            UserCard(
              cardColor: Colors.blue.withOpacity(0.3),
              userName: "User06969",
              userProfilePic: const AssetImage('assets/images/Ellipse1.png'),
              cardActionWidget: SettingsItem(
                icons: Icons.edit,
                iconStyle: IconStyle(
                  withBackground: true,
                  borderRadius: 50,
                  backgroundColor: Colors.yellow[600],
                ),
                title: "Modify",
                subtitle: "Tap to change your data",
                onTap: () {
                  print("OK");
                },
              ),
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.pencil_outline,
                  iconStyle: IconStyle(),
                  title:
                      'Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance',
                  subtitle:
                      "Make Ziar'App yours Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance",
                  titleMaxLine: 1,
                  subtitleMaxLine: 1,
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.fingerprint,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.red,
                  ),
                  title: 'Privacy',
                  subtitle: "Lock Ziar'App to improve your privacy",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.dark_mode_rounded,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.red,
                  ),
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
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.purple,
                  ),
                  title: 'About',
                  subtitle: "Learn more about Ziar'App",
                ),
              ],
            ),
            // You can add a settings title
            SettingsGroup(
              settingsGroupTitle: "Account",
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.exit_to_app_rounded,
                  title: "Sign Out",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.repeat,
                  title: "Change email",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.delete_solid,
                  title: "Delete account",
                  titleStyle: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
