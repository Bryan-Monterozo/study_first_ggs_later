import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
import 'package:study_first_ggs_later/modules/settings/view/widgets/settings_icon_style.dart';

class SettingsGroup2 extends StatelessWidget {
  final Color? cardColor;
  final Color? colorNotes;

  final IconData icons;
  final IconStyle? iconStyle;

  const SettingsGroup2({
    super.key,
    required this.colorNotes,
    required this.cardColor,
    this.iconStyle,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          color: colorNotes,
          borderRadius: const BorderRadius.all(
            Radius.circular(0),
          )),
      child: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}

class SettingsTitle extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final int? titleMaxLine;

  final TextOverflow? overflow;

  final IconData icons;
  final IconStyle? iconStyle;

  const SettingsTitle(
      {super.key,
      required this.icons,
      this.iconStyle,
      required this.title,
      this.titleStyle,
      this.titleMaxLine,
      this.overflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      child: ListTile(
        leading: (iconStyle != null && iconStyle!.withBackground!)
            ? Container(
                decoration: BoxDecoration(
                  color: iconStyle!.backgroundColor,
                  borderRadius: BorderRadius.circular(iconStyle!.borderRadius!),
                ),
                padding: const EdgeInsets.all(0),
                child: Icon(
                  icons,
                  size: SettingsScreenUtils.settingsGroupIconSize,
                  color: iconStyle!.iconsColor,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(
                  icons,
                  size: SettingsScreenUtils.settingsGroupIconSize,
                ),
              ),
        title: Text(
          title,
          style: titleStyle ?? const TextStyle(fontWeight: FontWeight.bold),
          maxLines: titleMaxLine,
          overflow: titleMaxLine != null ? overflow : null,
        ),
      ),
    );
  }
}

class SettingsScreenUtils {
  static double? settingsGroupIconSize;
  static TextStyle? settingsGroupTitleStyle;
}

class SettingsCardGesture extends StatelessWidget {
  final Widget? set2Navigator;
  final Widget? set2Container;

  const SettingsCardGesture(
      {super.key, required this.set2Navigator, this.set2Container});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => set2Navigator!,
          ),
        );
      },
      child: set2Container,
    );
  }
}

//not yet used will use for Account/ forgot password
GestureDetector buildAccountOption(BuildContext context, String title) {
  return GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Option 1"),
                Text("Option 2"),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Close"),
              ),
            ],
          );
        },
      );
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              )),
        ],
      ),
    ),
  );
}
