import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
import 'package:study_first_ggs_later/modules/reviewer/models/fc_model.dart';
import 'package:study_first_ggs_later/modules/settings/view/widgets/settings_icon_style.dart';


class PremiumCard extends StatelessWidget {
  final Color? cardColor;
  final Color? colorNotes;
  final CardModel? cardModel;

  final VoidCallback? onTap;

  final IconData icons;
  final IconStyle? iconStyle;


  const PremiumCard({
    super.key,
    required this.colorNotes,
    required this.cardColor,
    required this.cardModel, 

    this.onTap,

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
              Radius.circular(12),
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
                    fontSize: 25, fontWeight: FontWeight.w800,
                    fontFamily: 'Poppins', color: Colors.white),
              ),
            ],
          ),
        ),
      );
  }
}