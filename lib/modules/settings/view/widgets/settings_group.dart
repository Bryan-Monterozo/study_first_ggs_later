import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_first_ggs_later/modules/settings/view/widgets/settings_content2.dart';
import 'package:study_first_ggs_later/modules/settings/view/widgets/settings_item.dart';
import 'package:flutter/material.dart';

/// This component group the Settings items (BabsComponentSettingsItem)
/// All one BabsComponentSettingsGroup have a title and the developper can improve the design.
class SettingsGroup extends StatelessWidget {
  final String? settingsGroupTitle;
  final TextStyle? settingsGroupTitleStyle;
  final List<SettingsItem> items;
  final EdgeInsets? margin;
  // Icons size
  final double? iconItemSize;

  const SettingsGroup(
      {super.key,
      this.settingsGroupTitle,
      this.settingsGroupTitleStyle,
      required this.items,
      this.margin,
      this.iconItemSize = 40});

  @override
  Widget build(BuildContext context) {
    if (iconItemSize != null) {
      SettingsScreenUtils.settingsGroupIconSize = iconItemSize;
    }

    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // The title
          (settingsGroupTitle != null)
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: SettingsTitle(
                      title: settingsGroupTitle!,
                      titleStyle: settingsGroupTitleStyle,
                      icons: Icons.ac_unit_outlined),
                )
              : Container(),
          // The SettingsGroup sections
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return items[index];
              },
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const ScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsScreenUtils {
  static double? settingsGroupIconSize;
  static TextStyle? settingsGroupTitleStyle;
}
