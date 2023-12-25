import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:study_first_ggs_later/modules/reviewer/models/fc_model.dart';



class PremiumCard extends StatelessWidget {
  final Color? cardColor;
  final Color? colorNotes;
  final CardModel? cardModel;


  const PremiumCard({
    super.key,
    required this.colorNotes,
    required this.cardColor,
    required this.cardModel,

  });
 @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("In App purchase");
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: colorNotes,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            )),
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
      ),
    );
  }
}