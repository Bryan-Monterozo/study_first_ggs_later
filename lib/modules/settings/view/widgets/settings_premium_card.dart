import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
import 'package:study_first_ggs_later/modules/settings/view/widgets/settings_icon_style.dart';

class PremiumCard extends StatelessWidget {
  final Color? cardColor;
  final Color? colorNotes;

  final IconData icons;
  final IconStyle? iconStyle;

  const PremiumCard({
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
      width: double.infinity,
      decoration: BoxDecoration(
          color: colorNotes,
          borderRadius: const BorderRadius.all(
            Radius.circular(0),
          )),
      child: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.workspace_premium_rounded,
              size: 50,
              color: Colors.white,
            ),
            Text(
              "Upgrade to PRO",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Poppins',
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class PremiumCardGesture extends StatelessWidget {
  final Widget? premNavigator;
  final Widget? premContainer;

  const PremiumCardGesture(
      {super.key, required this.premNavigator, this.premContainer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => premNavigator!,
          ),
        );
      },
      child: premContainer,
    );
  }
}