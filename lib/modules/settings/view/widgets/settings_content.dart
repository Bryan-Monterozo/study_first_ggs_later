import 'package:study_first_ggs_later/modules/settings/view/widgets/settings_item.dart';
import 'package:study_first_ggs_later/modules/settings/view/widgets/settings_screen_utils.dart';
import 'package:study_first_ggs_later/modules/settings/view/widgets/settings_group.dart';
import 'package:flutter/material.dart';

class SettingsContent extends StatelessWidget{
    final VoidCallback? onTap;


  const SettingsContent({super.key,
    this.onTap,

  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
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
                icons: Icons.notifications,
                title: 'Notifications',
                subtitle: "Manage your notifications",
              ),
              SettingsItem(
                onTap: () {},
                icons: Icons.language,
                title: 'Language',
                subtitle: "Change the language of the app",
              ),
              SettingsItem(
                onTap: () {},
                icons: Icons.color_lens,
                title: 'Theme',
                subtitle: "Change the theme of the app",
              ),
              SettingsItem(
                onTap: () {},
                icons: Icons.info,
                title: 'About',
                subtitle: "About Study First",
              ),
            ],
          ),
          SettingsGroup(
            settingsGroupTitle: "Account",
            items: [
              SettingsItem(
                onTap: () {},
                icons: Icons.person,
                title: 'Profile',
                subtitle: "Manage your profile",
              ),
              SettingsItem(
                onTap: () {},
                icons: Icons.lock,
                title: 'Password',
                subtitle: "Change your password",
              ),
              SettingsItem(
                onTap: () {},
                icons: Icons.logout,
                title: 'Logout',
                subtitle: "Logout from your account",
              ),
            ],
          ),
          SettingsGroup(
            settingsGroupTitle: "Premium",
            items: [
              SettingsItem(
                onTap: () {},
                icons: Icons.star,
                title: 'Premium',
                subtitle: "Get Premium",
              ),
            ],
          ),
        ],
      )
    );
  }

}